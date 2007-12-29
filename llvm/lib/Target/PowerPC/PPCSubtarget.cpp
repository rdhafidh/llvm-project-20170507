//===- PowerPCSubtarget.cpp - PPC Subtarget Information -------------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file implements the PPC specific subclass of TargetSubtarget.
//
//===----------------------------------------------------------------------===//

#include "PPCSubtarget.h"
#include "PPC.h"
#include "llvm/Module.h"
#include "llvm/Target/TargetMachine.h"
#include "PPCGenSubtarget.inc"
using namespace llvm;

#if defined(__APPLE__)
#include <mach/mach.h>
#include <mach/mach_host.h>
#include <mach/host_info.h>
#include <mach/machine.h>

/// GetCurrentPowerPCFeatures - Returns the current CPUs features.
static const char *GetCurrentPowerPCCPU() {
  host_basic_info_data_t hostInfo;
  mach_msg_type_number_t infoCount;

  infoCount = HOST_BASIC_INFO_COUNT;
  host_info(mach_host_self(), HOST_BASIC_INFO, (host_info_t)&hostInfo, 
            &infoCount);
            
  if (hostInfo.cpu_type != CPU_TYPE_POWERPC) return "generic";

  switch(hostInfo.cpu_subtype) {
  case CPU_SUBTYPE_POWERPC_601:   return "601";
  case CPU_SUBTYPE_POWERPC_602:   return "602";
  case CPU_SUBTYPE_POWERPC_603:   return "603";
  case CPU_SUBTYPE_POWERPC_603e:  return "603e";
  case CPU_SUBTYPE_POWERPC_603ev: return "603ev";
  case CPU_SUBTYPE_POWERPC_604:   return "604";
  case CPU_SUBTYPE_POWERPC_604e:  return "604e";
  case CPU_SUBTYPE_POWERPC_620:   return "620";
  case CPU_SUBTYPE_POWERPC_750:   return "750";
  case CPU_SUBTYPE_POWERPC_7400:  return "7400";
  case CPU_SUBTYPE_POWERPC_7450:  return "7450";
  case CPU_SUBTYPE_POWERPC_970:   return "970";
  default: ;
  }
  
  return "generic";
}
#endif


PPCSubtarget::PPCSubtarget(const TargetMachine &tm, const Module &M,
                           const std::string &FS, bool is64Bit)
  : TM(tm)
  , StackAlignment(16)
  , IsGigaProcessor(false)
  , Has64BitSupport(false)
  , Use64BitRegs(false)
  , IsPPC64(is64Bit)
  , HasAltivec(false)
  , HasFSQRT(false)
  , HasSTFIWX(false)
  , IsDarwin(false)
  , HasLazyResolverStubs(false) {

  // Determine default and user specified characteristics
  std::string CPU = "generic";
#if defined(__APPLE__)
  CPU = GetCurrentPowerPCCPU();
#endif

  // Parse features string.
  ParseSubtargetFeatures(FS, CPU);

  // If we are generating code for ppc64, verify that options make sense.
  if (is64Bit) {
    if (!has64BitSupport()) {
      cerr << "PPC: Generation of 64-bit code for a 32-bit processor "
           << "requested.  Ignoring 32-bit processor feature.\n";
      Has64BitSupport = true;
    }
    // Silently force 64-bit register use on ppc64.
    Use64BitRegs = true;
  }
  
  // If the user requested use of 64-bit regs, but the cpu selected doesn't
  // support it, warn and ignore.
  if (use64BitRegs() && !has64BitSupport()) {
    cerr << "PPC: 64-bit registers requested on CPU without support.  "
         << "Disabling 64-bit register use.\n";
    Use64BitRegs = false;
  }
  
  // Set the boolean corresponding to the current target triple, or the default
  // if one cannot be determined, to true.
  const std::string& TT = M.getTargetTriple();
  if (TT.length() > 5) {
    IsDarwin = TT.find("-darwin") != std::string::npos;
  } else if (TT.empty()) {
#if defined(__APPLE__)
    IsDarwin = true;
#endif
  }

  // Set up darwin-specific properties.
  if (IsDarwin) {
    HasLazyResolverStubs = true;
    AsmFlavor = NewMnemonic;
  } else {
    AsmFlavor = OldMnemonic;
  }
}

/// SetJITMode - This is called to inform the subtarget info that we are
/// producing code for the JIT.
void PPCSubtarget::SetJITMode() {
  // JIT mode doesn't want lazy resolver stubs, it knows exactly where
  // everything is.  This matters for PPC64, which codegens in PIC mode without
  // stubs.
  HasLazyResolverStubs = false;
}


/// hasLazyResolverStub - Return true if accesses to the specified global have
/// to go through a dyld lazy resolution stub.  This means that an extra load
/// is required to get the address of the global.
bool PPCSubtarget::hasLazyResolverStub(const GlobalValue *GV) const {
  // We never hae stubs if HasLazyResolverStubs=false or if in static mode.
  if (!HasLazyResolverStubs || TM.getRelocationModel() == Reloc::Static)
    return false;
  
  return GV->hasWeakLinkage() || GV->hasLinkOnceLinkage() ||
         (GV->isDeclaration() && !GV->hasNotBeenReadFromBitcode());
}
