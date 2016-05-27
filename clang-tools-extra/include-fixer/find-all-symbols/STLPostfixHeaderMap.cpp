//===-- STLPostfixHeaderMap.h - hardcoded STL header map --------*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

#include "STLPostfixHeaderMap.h"

namespace clang {
namespace find_all_symbols {

const HeaderMapCollector::HeaderMap *getSTLPostfixHeaderMap() {
  static const HeaderMapCollector::HeaderMap STLPostfixHeaderMap = {
      {"include/__stddef_max_align_t.h", "<cstddef>"},
      {"include/__wmmintrin_aes.h", "<wmmintrin.h>"},
      {"include/__wmmintrin_pclmul.h", "<wmmintrin.h>"},
      {"include/adxintrin.h", "<immintrin.h>"},
      {"include/ammintrin.h", "<ammintrin.h>"},
      {"include/avx2intrin.h", "<immintrin.h>"},
      {"include/avx512bwintrin.h", "<immintrin.h>"},
      {"include/avx512cdintrin.h", "<immintrin.h>"},
      {"include/avx512dqintrin.h", "<immintrin.h>"},
      {"include/avx512erintrin.h", "<immintrin.h>"},
      {"include/avx512fintrin.h", "<immintrin.h>"},
      {"include/avx512ifmaintrin.h", "<immintrin.h>"},
      {"include/avx512ifmavlintrin.h", "<immintrin.h>"},
      {"include/avx512pfintrin.h", "<immintrin.h>"},
      {"include/avx512vbmiintrin.h", "<immintrin.h>"},
      {"include/avx512vbmivlintrin.h", "<immintrin.h>"},
      {"include/avx512vlbwintrin.h", "<immintrin.h>"},
      {"include/avx512vlcdintrin.h", "<immintrin.h>"},
      {"include/avx512vldqintrin.h", "<immintrin.h>"},
      {"include/avx512vlintrin.h", "<immintrin.h>"},
      {"include/avxintrin.h", "<immintrin.h>"},
      {"include/bmi2intrin.h", "<x86intrin.h>"},
      {"include/bmiintrin.h", "<x86intrin.h>"},
      {"include/emmintrin.h", "<emmintrin.h>"},
      {"include/f16cintrin.h", "<emmintrin.h>"},
      {"include/float.h", "<cfloat>"},
      {"include/fma4intrin.h", "<x86intrin.h>"},
      {"include/fmaintrin.h", "<immintrin.h>"},
      {"include/fxsrintrin.h", "<immintrin.h>"},
      {"include/ia32intrin.h", "<x86intrin.h>"},
      {"include/immintrin.h", "<immintrin.h>"},
      {"include/inttypes.h", "<cinttypes>"},
      {"include/limits.h", "<climits>"},
      {"include/lzcntintrin.h", "<x86intrin.h>"},
      {"include/mm3dnow.h", "<mm3dnow.h>"},
      {"include/mm_malloc.h", "<mm_malloc.h>"},
      {"include/mmintrin.h", "<mmintrin>"},
      {"include/mwaitxintrin.h", "<x86intrin.h>"},
      {"include/pkuintrin.h", "<immintrin.h>"},
      {"include/pmmintrin.h", "<pmmintrin.h>"},
      {"include/popcntintrin.h", "<popcntintrin.h>"},
      {"include/prfchwintrin.h", "<x86intrin.h>"},
      {"include/rdseedintrin.h", "<x86intrin.h>"},
      {"include/rtmintrin.h", "<immintrin.h>"},
      {"include/shaintrin.h", "<immintrin.h>"},
      {"include/smmintrin.h", "<smmintrin.h>"},
      {"include/stdalign.h", "<cstdalign>"},
      {"include/stdarg.h", "<cstdarg>"},
      {"include/stdbool.h", "<cstdbool>"},
      {"include/stddef.h", "<cwchar>"},
      {"include/stdint.h", "<cstdint>"},
      {"include/tbmintrin.h", "<x86intrin.h>"},
      {"include/tmmintrin.h", "<tmmintrin.h>"},
      {"include/wmmintrin.h", "<wmmintrin.h>"},
      {"include/x86intrin.h", "<x86intrin.h>"},
      {"include/xmmintrin.h", "<xmmintrin.h>"},
      {"include/xopintrin.h", "<x86intrin.h>"},
      {"include/xsavecintrin.h", "<immintrin.h>"},
      {"include/xsaveintrin.h", "<immintrin.h>"},
      {"include/xsaveoptintrin.h", "<immintrin.h>"},
      {"include/xsavesintrin.h", "<immintrin.h>"},
      {"include/xtestintrin.h", "<immintrin.h>"},
      {"include/_G_config.h", "<cstdio>"},
      {"include/alloca.h", "<cstdlib>"},
      {"include/asm-generic/errno-base.h", "<cerrno>"},
      {"include/asm-generic/errno.h", "<cerrno>"},
      {"include/assert.h", "<cassert>"},
      {"algorithm", "<algorithm>"},
      {"array", "<array>"},
      {"atomic", "<atomic>"},
      {"backward/auto_ptr.h", "<memory>"},
      {"backward/binders.h", "<string>"},
      {"bits/algorithmfwd.h", "<algorithm>"},
      {"bits/alloc_traits.h", "<unordered_set>"},
      {"bits/allocator.h", "<string>"},
      {"bits/atomic_base.h", "<atomic>"},
      {"bits/atomic_lockfree_defines.h", "<exception>"},
      {"bits/basic_ios.h", "<ios>"},
      {"bits/basic_ios.tcc", "<ios>"},
      {"bits/basic_string.h", "<string>"},
      {"bits/basic_string.tcc", "<string>"},
      {"bits/char_traits.h", "<string>"},
      {"bits/codecvt.h", "<fstream>"},
      {"bits/concept_check.h", "<numeric>"},
      {"bits/cpp_type_traits.h", "<cmath>"},
      {"bits/cxxabi_forced.h", "<cxxabi.h>"},
      {"bits/deque.tcc", "<deque>"},
      {"bits/exception_defines.h", "<exception>"},
      {"bits/exception_ptr.h", "<exception>"},
      {"bits/forward_list.h", "<forward_list>"},
      {"bits/forward_list.tcc", "<forward_list>"},
      {"bits/fstream.tcc", "<fstream>"},
      {"bits/functexcept.h", "<list>"},
      {"bits/functional_hash.h", "<string>"},
      {"bits/gslice.h", "<valarray>"},
      {"bits/gslice_array.h", "<valarray>"},
      {"bits/hash_bytes.h", "<typeinfo>"},
      {"bits/hashtable.h", "<unordered_set>"},
      {"bits/hashtable_policy.h", "<unordered_set>"},
      {"bits/indirect_array.h", "<valarray>"},
      {"bits/ios_base.h", "<streambuf>"},
      {"bits/istream.tcc", "<istream>"},
      {"bits/list.tcc", "<list>"},
      {"bits/locale_classes.h", "<locale>"},
      {"bits/locale_classes.tcc", "<locale>"},
      {"bits/locale_facets.h", "<locale>"},
      {"bits/locale_facets.tcc", "<locale>"},
      {"bits/locale_facets_nonio.h", "<locale>"},
      {"bits/locale_facets_nonio.tcc", "<locale>"},
      {"bits/localefwd.h", "<string>"},
      {"bits/mask_array.h", "<valarray>"},
      {"bits/memoryfwd.h", "<string>"},
      {"bits/move.h", "<utility>"},
      {"bits/nested_exception.h", "<exception>"},
      {"bits/ostream.tcc", "<ostream>"},
      {"bits/ostream_insert.h", "<string>"},
      {"bits/postypes.h", "<iosfwd>"},
      {"bits/ptr_traits.h", "<unordered_set>"},
      {"bits/random.h", "<random>"},
      {"bits/random.tcc", "<random>"},
      {"bits/range_access.h", "<string>"},
      {"bits/regex.h", "<regex>"},
      {"bits/regex_compiler.h", "<regex>"},
      {"bits/regex_constants.h", "<regex>"},
      {"bits/regex_cursor.h", "<regex>"},
      {"bits/regex_error.h", "<regex>"},
      {"bits/regex_grep_matcher.h", "<regex>"},
      {"bits/regex_grep_matcher.tcc", "<regex>"},
      {"bits/regex_nfa.h", "<regex>"},
      {"bits/shared_ptr.h", "<memory>"},
      {"bits/shared_ptr_base.h", "<memory>"},
      {"bits/slice_array.h", "<valarray>"},
      {"bits/sstream.tcc", "<sstream>"},
      {"bits/stl_algo.h", "<algorithm>"},
      {"bits/stl_algobase.h", "<list>"},
      {"bits/stl_bvector.h", "<vector>"},
      {"bits/stl_construct.h", "<deque>"},
      {"bits/stl_deque.h", "<deque>"},
      {"bits/stl_function.h", "<string>"},
      {"bits/stl_heap.h", "<queue>"},
      {"bits/stl_iterator.h", "<iterator>"},
      {"bits/stl_iterator_base_funcs.h", "<iterator>"},
      {"bits/stl_iterator_base_types.h", "<numeric>"},
      {"bits/stl_list.h", "<list>"},
      {"bits/stl_map.h", "<map>"},
      {"bits/stl_multimap.h", "<map>"},
      {"bits/stl_multiset.h", "<set>"},
      {"bits/stl_numeric.h", "<numeric>"},
      {"bits/stl_pair.h", "<utility>"},
      {"bits/stl_queue.h", "<queue>"},
      {"bits/stl_raw_storage_iter.h", "<memory>"},
      {"bits/stl_relops.h", "<utility>"},
      {"bits/stl_set.h", "<set>"},
      {"bits/stl_stack.h", "<stack>"},
      {"bits/stl_tempbuf.h", "<memory>"},
      {"bits/stl_tree.h", "<map>"},
      {"bits/stl_uninitialized.h", "<deque>"},
      {"bits/stl_vector.h", "<vector>"},
      {"bits/stream_iterator.h", "<iterator>"},
      {"bits/streambuf.tcc", "<streambuf>"},
      {"bits/streambuf_iterator.h", "<locale>"},
      {"bits/stringfwd.h", "<string>"},
      {"bits/unique_ptr.h", "<memory>"},
      {"bits/unordered_map.h", "<unordered_map>"},
      {"bits/unordered_set.h", "<unordered_set>"},
      {"bits/uses_allocator.h", "<tuple>"},
      {"bits/valarray_after.h", "<valarray>"},
      {"bits/valarray_array.h", "<valarray>"},
      {"bits/valarray_array.tcc", "<valarray>"},
      {"bits/valarray_before.h", "<valarray>"},
      {"bits/vector.tcc", "<vector>"},
      {"bitset", "<bitset>"},
      {"ccomplex", "<ccomplex>"},
      {"cctype", "<cctype>"},
      {"cerrno", "<cerrno>"},
      {"cfenv", "<cfenv>"},
      {"cfloat", "<cfloat>"},
      {"chrono", "<chrono>"},
      {"cinttypes", "<cinttypes>"},
      {"climits", "<climits>"},
      {"clocale", "<clocale>"},
      {"cmath", "<cmath>"},
      {"complex", "<complex>"},
      {"complex.h", "<complex.h>"},
      {"condition_variable", "<condition_variable>"},
      {"csetjmp", "<csetjmp>"},
      {"csignal", "<csignal>"},
      {"cstdalign", "<cstdalign>"},
      {"cstdarg", "<cstdarg>"},
      {"cstdbool", "<cstdbool>"},
      {"cstdint", "<cstdint>"},
      {"cstdio", "<cstdio>"},
      {"cstdlib", "<cstdlib>"},
      {"cstring", "<cstring>"},
      {"ctgmath", "<ctgmath>"},
      {"ctime", "<ctime>"},
      {"cwchar", "<cwchar>"},
      {"cwctype", "<cwctype>"},
      {"cxxabi.h", "<cxxabi.h>"},
      {"debug/debug.h", "<numeric>"},
      {"deque", "<deque>"},
      {"exception", "<exception>"},
      {"ext/alloc_traits.h", "<deque>"},
      {"ext/atomicity.h", "<memory>"},
      {"ext/concurrence.h", "<memory>"},
      {"ext/new_allocator.h", "<string>"},
      {"ext/numeric_traits.h", "<list>"},
      {"ext/string_conversions.h", "<string>"},
      {"ext/type_traits.h", "<cmath>"},
      {"fenv.h", "<fenv.h>"},
      {"forward_list", "<forward_list>"},
      {"fstream", "<fstream>"},
      {"functional", "<functional>"},
      {"future", "<future>"},
      {"initializer_list", "<initializer_list>"},
      {"iomanip", "<iomanip>"},
      {"ios", "<ios>"},
      {"iosfwd", "<iosfwd>"},
      {"iostream", "<iostream>"},
      {"istream", "<istream>"},
      {"iterator", "<iterator>"},
      {"limits", "<limits>"},
      {"list", "<list>"},
      {"locale", "<locale>"},
      {"map", "<map>"},
      {"memory", "<memory>"},
      {"mutex", "<mutex>"},
      {"new", "<new>"},
      {"numeric", "<numeric>"},
      {"ostream", "<ostream>"},
      {"queue", "<queue>"},
      {"random", "<random>"},
      {"ratio", "<ratio>"},
      {"regex", "<regex>"},
      {"scoped_allocator", "<scoped_allocator>"},
      {"set", "<set>"},
      {"sstream", "<sstream>"},
      {"stack", "<stack>"},
      {"stdexcept", "<stdexcept>"},
      {"streambuf", "<streambuf>"},
      {"string", "<string>"},
      {"system_error", "<system_error>"},
      {"tgmath.h", "<tgmath.h>"},
      {"thread", "<thread>"},
      {"tuple", "<tuple>"},
      {"type_traits", "<type_traits>"},
      {"typeindex", "<typeindex>"},
      {"typeinfo", "<typeinfo>"},
      {"unordered_map", "<unordered_map>"},
      {"unordered_set", "<unordered_set>"},
      {"utility", "<utility>"},
      {"valarray", "<valarray>"},
      {"vector", "<vector>"},
      {"include/complex.h", "<complex.h>"},
      {"include/ctype.h", "<cctype>"},
      {"include/endian.h", "<cctype>"},
      {"include/errno.h", "<cerrno>"},
      {"include/features.h", "<cerrno>"},
      {"include/fenv.h", "<fenv.h>"},
      {"include/inttypes.h", "<cinttypes>"},
      {"include/libintl.h", "<locale>"},
      {"include/libio.h", "<cstdio>"},
      {"include/limits.h", "<climits>"},
      {"include/linux/limits.h", "<climits>"},
      {"include/locale.h", "<clocale>"},
      {"include/math.h", "<cmath>"},
      {"include/pthread.h", "<memory>"},
      {"include/sched.h", "<memory>"},
      {"include/setjmp.h", "<csetjmp>"},
      {"include/signal.h", "<csignal>"},
      {"include/stdc-predef.h", "<cerrno>"},
      {"include/stdint.h", "<cstdint>"},
      {"include/stdio.h", "<cstdio>"},
      {"include/stdlib.h", "<cstdlib>"},
      {"include/string.h", "<cstring>"},
      {"include/time.h", "<ctime>"},
      {"include/wchar.h", "<cwchar>"},
      {"include/wctype.h", "<cwctype>"},
      {"bits/byteswap-16.h", "<cctype>"},
      {"bits/byteswap.h", "<cctype>"},
      {"bits/cmathcalls.h", "<complex.h>"},
      {"bits/endian.h", "<cctype>"},
      {"bits/errno.h", "<cerrno>"},
      {"bits/fenv.h", "<fenv.h>"},
      {"bits/huge_val.h", "<cmath>"},
      {"bits/huge_valf.h", "<cmath>"},
      {"bits/huge_vall.h", "<cmath>"},
      {"bits/inf.h", "<cmath>"},
      {"bits/local_lim.h", "<climits>"},
      {"bits/locale.h", "<clocale>"},
      {"bits/mathcalls.h", "<math.h>"},
      {"bits/mathdef.h", "<cmath>"},
      {"bits/nan.h", "<cmath>"},
      {"bits/posix1_lim.h", "<climits>"},
      {"bits/posix2_lim.h", "<climits>"},
      {"bits/pthreadtypes.h", "<csignal>"},
      {"bits/sched.h", "<memory>"},
      {"bits/select.h", "<cstdlib>"},
      {"bits/setjmp.h", "<csetjmp>"},
      {"bits/sigaction.h", "<csignal>"},
      {"bits/sigcontext.h", "<csignal>"},
      {"bits/siginfo.h", "<csignal>"},
      {"bits/signum.h", "<csignal>"},
      {"bits/sigset.h", "<csignal>"},
      {"bits/sigstack.h", "<csignal>"},
      {"bits/sigthread.h", "<csignal>"},
      {"bits/stdio_lim.h", "<cstdio>"},
      {"bits/sys_errlist.h", "<cstdio>"},
      {"bits/time.h", "<ctime>"},
      {"bits/timex.h", "<ctime>"},
      {"bits/types.h", "<cstdio>"},
      {"bits/typesizes.h", "<cstdio>"},
      {"bits/waitflags.h", "<cstdlib>"},
      {"bits/waitstatus.h", "<cstdlib>"},
      {"bits/wchar.h", "<cwchar>"},
      {"bits/wordsize.h", "<csetjmp>"},
      {"bits/xopen_lim.h", "<climits>"},
      {"gnu/stubs-64.h", "<cerrno>"},
      {"sys/cdefs.h", "<cerrno>"},
      {"sys/select.h", "<cstdlib>"},
      {"sys/sysmacros.h", "<cstdlib>"},
      {"sys/types.h", "<cstdlib>"},
      {"sys/ucontext.h", "<csignal>"},
      {"include/xlocale.h", "<cstring>"},
      {"bits/atomic_word.h", "<memory>"},
      {"bits/basic_file.h", "<fstream>"},
      {"bits/c++allocator.h", "<string>"},
      {"bits/c++config.h", "<iosfwd>"},
      {"bits/c++io.h", "<fstream>"},
      {"bits/c++locale.h", "<string>"},
      {"bits/cpu_defines.h", "<iosfwd>"},
      {"bits/ctype_base.h", "<locale>"},
      {"bits/cxxabi_tweaks.h", "<cxxabi.h>"},
      {"bits/error_constants.h", "<system_error>"},
      {"bits/gthr-default.h", "<memory>"},
      {"bits/gthr.h", "<memory>"},
      {"bits/opt_random.h", "<random>"},
      {"bits/os_defines.h", "<iosfwd>"},
  };
  return &STLPostfixHeaderMap;
}

} // namespace find_all_symbols
} // namespace clang
