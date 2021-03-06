; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt < %s -mtriple=x86_64-unknown -basicaa -slp-vectorizer -instcombine -S | FileCheck %s --check-prefix=CHECK --check-prefix=SSE
; RUN: opt < %s -mtriple=x86_64-unknown -mcpu=slm -basicaa -slp-vectorizer -instcombine -S | FileCheck %s --check-prefix=CHECK --check-prefix=SLM
; RUN: opt < %s -mtriple=x86_64-unknown -mcpu=corei7-avx -basicaa -slp-vectorizer -instcombine -S | FileCheck %s --check-prefix=CHECK --check-prefix=AVX --check-prefix=AVX1
; RUN: opt < %s -mtriple=x86_64-unknown -mcpu=core-avx2 -basicaa -slp-vectorizer -instcombine -S | FileCheck %s --check-prefix=CHECK --check-prefix=AVX --check-prefix=AVX2
; RUN: opt < %s -mtriple=x86_64-unknown -mcpu=knl -basicaa -slp-vectorizer -instcombine -S | FileCheck %s --check-prefix=CHECK --check-prefix=AVX512 --check-prefix=AVX512F
; RUN: opt < %s -mtriple=x86_64-unknown -mcpu=skx -basicaa -slp-vectorizer -instcombine -S | FileCheck %s --check-prefix=CHECK --check-prefix=AVX512 --check-prefix=AVX512BW

define <8 x i32> @add_sub_v8i32(<8 x i32> %a, <8 x i32> %b) {
; CHECK-LABEL: @add_sub_v8i32(
; CHECK-NEXT:    [[A4:%.*]] = extractelement <8 x i32> [[A:%.*]], i32 4
; CHECK-NEXT:    [[A5:%.*]] = extractelement <8 x i32> [[A]], i32 5
; CHECK-NEXT:    [[A6:%.*]] = extractelement <8 x i32> [[A]], i32 6
; CHECK-NEXT:    [[A7:%.*]] = extractelement <8 x i32> [[A]], i32 7
; CHECK-NEXT:    [[B4:%.*]] = extractelement <8 x i32> [[B:%.*]], i32 4
; CHECK-NEXT:    [[B5:%.*]] = extractelement <8 x i32> [[B]], i32 5
; CHECK-NEXT:    [[B6:%.*]] = extractelement <8 x i32> [[B]], i32 6
; CHECK-NEXT:    [[B7:%.*]] = extractelement <8 x i32> [[B]], i32 7
; CHECK-NEXT:    [[TMP1:%.*]] = add <8 x i32> [[A]], [[B]]
; CHECK-NEXT:    [[AB4:%.*]] = sub i32 [[A4]], [[B4]]
; CHECK-NEXT:    [[AB5:%.*]] = sub i32 [[A5]], [[B5]]
; CHECK-NEXT:    [[AB6:%.*]] = sub i32 [[A6]], [[B6]]
; CHECK-NEXT:    [[AB7:%.*]] = sub i32 [[A7]], [[B7]]
; CHECK-NEXT:    [[TMP2:%.*]] = extractelement <8 x i32> [[TMP1]], i32 0
; CHECK-NEXT:    [[R0:%.*]] = insertelement <8 x i32> undef, i32 [[TMP2]], i32 0
; CHECK-NEXT:    [[TMP3:%.*]] = extractelement <8 x i32> [[TMP1]], i32 1
; CHECK-NEXT:    [[R1:%.*]] = insertelement <8 x i32> [[R0]], i32 [[TMP3]], i32 1
; CHECK-NEXT:    [[TMP4:%.*]] = extractelement <8 x i32> [[TMP1]], i32 2
; CHECK-NEXT:    [[R2:%.*]] = insertelement <8 x i32> [[R1]], i32 [[TMP4]], i32 2
; CHECK-NEXT:    [[TMP5:%.*]] = extractelement <8 x i32> [[TMP1]], i32 3
; CHECK-NEXT:    [[R3:%.*]] = insertelement <8 x i32> [[R2]], i32 [[TMP5]], i32 3
; CHECK-NEXT:    [[R4:%.*]] = insertelement <8 x i32> [[R3]], i32 [[AB4]], i32 4
; CHECK-NEXT:    [[R5:%.*]] = insertelement <8 x i32> [[R4]], i32 [[AB5]], i32 5
; CHECK-NEXT:    [[R6:%.*]] = insertelement <8 x i32> [[R5]], i32 [[AB6]], i32 6
; CHECK-NEXT:    [[R7:%.*]] = insertelement <8 x i32> [[R6]], i32 [[AB7]], i32 7
; CHECK-NEXT:    ret <8 x i32> [[R7]]
;
  %a0 = extractelement <8 x i32> %a, i32 0
  %a1 = extractelement <8 x i32> %a, i32 1
  %a2 = extractelement <8 x i32> %a, i32 2
  %a3 = extractelement <8 x i32> %a, i32 3
  %a4 = extractelement <8 x i32> %a, i32 4
  %a5 = extractelement <8 x i32> %a, i32 5
  %a6 = extractelement <8 x i32> %a, i32 6
  %a7 = extractelement <8 x i32> %a, i32 7
  %b0 = extractelement <8 x i32> %b, i32 0
  %b1 = extractelement <8 x i32> %b, i32 1
  %b2 = extractelement <8 x i32> %b, i32 2
  %b3 = extractelement <8 x i32> %b, i32 3
  %b4 = extractelement <8 x i32> %b, i32 4
  %b5 = extractelement <8 x i32> %b, i32 5
  %b6 = extractelement <8 x i32> %b, i32 6
  %b7 = extractelement <8 x i32> %b, i32 7
  %ab0 = add i32 %a0, %b0
  %ab1 = add i32 %a1, %b1
  %ab2 = add i32 %a2, %b2
  %ab3 = add i32 %a3, %b3
  %ab4 = sub i32 %a4, %b4
  %ab5 = sub i32 %a5, %b5
  %ab6 = sub i32 %a6, %b6
  %ab7 = sub i32 %a7, %b7
  %r0 = insertelement <8 x i32> undef, i32 %ab0, i32 0
  %r1 = insertelement <8 x i32>   %r0, i32 %ab1, i32 1
  %r2 = insertelement <8 x i32>   %r1, i32 %ab2, i32 2
  %r3 = insertelement <8 x i32>   %r2, i32 %ab3, i32 3
  %r4 = insertelement <8 x i32>   %r3, i32 %ab4, i32 4
  %r5 = insertelement <8 x i32>   %r4, i32 %ab5, i32 5
  %r6 = insertelement <8 x i32>   %r5, i32 %ab6, i32 6
  %r7 = insertelement <8 x i32>   %r6, i32 %ab7, i32 7
  ret <8 x i32> %r7
}

define <4 x i32> @add_and_v4i32(<4 x i32> %a, <4 x i32> %b) {
; SSE-LABEL: @add_and_v4i32(
; SSE-NEXT:    [[A2:%.*]] = extractelement <4 x i32> [[A:%.*]], i32 2
; SSE-NEXT:    [[A3:%.*]] = extractelement <4 x i32> [[A]], i32 3
; SSE-NEXT:    [[B2:%.*]] = extractelement <4 x i32> [[B:%.*]], i32 2
; SSE-NEXT:    [[B3:%.*]] = extractelement <4 x i32> [[B]], i32 3
; SSE-NEXT:    [[TMP1:%.*]] = add <4 x i32> [[A]], [[B]]
; SSE-NEXT:    [[AB2:%.*]] = and i32 [[A2]], [[B2]]
; SSE-NEXT:    [[AB3:%.*]] = and i32 [[A3]], [[B3]]
; SSE-NEXT:    [[TMP2:%.*]] = extractelement <4 x i32> [[TMP1]], i32 0
; SSE-NEXT:    [[R0:%.*]] = insertelement <4 x i32> undef, i32 [[TMP2]], i32 0
; SSE-NEXT:    [[TMP3:%.*]] = extractelement <4 x i32> [[TMP1]], i32 1
; SSE-NEXT:    [[R1:%.*]] = insertelement <4 x i32> [[R0]], i32 [[TMP3]], i32 1
; SSE-NEXT:    [[R2:%.*]] = insertelement <4 x i32> [[R1]], i32 [[AB2]], i32 2
; SSE-NEXT:    [[R3:%.*]] = insertelement <4 x i32> [[R2]], i32 [[AB3]], i32 3
; SSE-NEXT:    ret <4 x i32> [[R3]]
;
; SLM-LABEL: @add_and_v4i32(
; SLM-NEXT:    [[A0:%.*]] = extractelement <4 x i32> [[A:%.*]], i32 0
; SLM-NEXT:    [[A1:%.*]] = extractelement <4 x i32> [[A]], i32 1
; SLM-NEXT:    [[A2:%.*]] = extractelement <4 x i32> [[A]], i32 2
; SLM-NEXT:    [[A3:%.*]] = extractelement <4 x i32> [[A]], i32 3
; SLM-NEXT:    [[B0:%.*]] = extractelement <4 x i32> [[B:%.*]], i32 0
; SLM-NEXT:    [[B1:%.*]] = extractelement <4 x i32> [[B]], i32 1
; SLM-NEXT:    [[B2:%.*]] = extractelement <4 x i32> [[B]], i32 2
; SLM-NEXT:    [[B3:%.*]] = extractelement <4 x i32> [[B]], i32 3
; SLM-NEXT:    [[AB0:%.*]] = add i32 [[A0]], [[B0]]
; SLM-NEXT:    [[AB1:%.*]] = add i32 [[A1]], [[B1]]
; SLM-NEXT:    [[AB2:%.*]] = and i32 [[A2]], [[B2]]
; SLM-NEXT:    [[AB3:%.*]] = and i32 [[A3]], [[B3]]
; SLM-NEXT:    [[R0:%.*]] = insertelement <4 x i32> undef, i32 [[AB0]], i32 0
; SLM-NEXT:    [[R1:%.*]] = insertelement <4 x i32> [[R0]], i32 [[AB1]], i32 1
; SLM-NEXT:    [[R2:%.*]] = insertelement <4 x i32> [[R1]], i32 [[AB2]], i32 2
; SLM-NEXT:    [[R3:%.*]] = insertelement <4 x i32> [[R2]], i32 [[AB3]], i32 3
; SLM-NEXT:    ret <4 x i32> [[R3]]
;
; AVX-LABEL: @add_and_v4i32(
; AVX-NEXT:    [[A2:%.*]] = extractelement <4 x i32> [[A:%.*]], i32 2
; AVX-NEXT:    [[A3:%.*]] = extractelement <4 x i32> [[A]], i32 3
; AVX-NEXT:    [[B2:%.*]] = extractelement <4 x i32> [[B:%.*]], i32 2
; AVX-NEXT:    [[B3:%.*]] = extractelement <4 x i32> [[B]], i32 3
; AVX-NEXT:    [[TMP1:%.*]] = add <4 x i32> [[A]], [[B]]
; AVX-NEXT:    [[AB2:%.*]] = and i32 [[A2]], [[B2]]
; AVX-NEXT:    [[AB3:%.*]] = and i32 [[A3]], [[B3]]
; AVX-NEXT:    [[TMP2:%.*]] = extractelement <4 x i32> [[TMP1]], i32 0
; AVX-NEXT:    [[R0:%.*]] = insertelement <4 x i32> undef, i32 [[TMP2]], i32 0
; AVX-NEXT:    [[TMP3:%.*]] = extractelement <4 x i32> [[TMP1]], i32 1
; AVX-NEXT:    [[R1:%.*]] = insertelement <4 x i32> [[R0]], i32 [[TMP3]], i32 1
; AVX-NEXT:    [[R2:%.*]] = insertelement <4 x i32> [[R1]], i32 [[AB2]], i32 2
; AVX-NEXT:    [[R3:%.*]] = insertelement <4 x i32> [[R2]], i32 [[AB3]], i32 3
; AVX-NEXT:    ret <4 x i32> [[R3]]
;
; AVX512-LABEL: @add_and_v4i32(
; AVX512-NEXT:    [[A2:%.*]] = extractelement <4 x i32> [[A:%.*]], i32 2
; AVX512-NEXT:    [[A3:%.*]] = extractelement <4 x i32> [[A]], i32 3
; AVX512-NEXT:    [[B2:%.*]] = extractelement <4 x i32> [[B:%.*]], i32 2
; AVX512-NEXT:    [[B3:%.*]] = extractelement <4 x i32> [[B]], i32 3
; AVX512-NEXT:    [[TMP1:%.*]] = add <4 x i32> [[A]], [[B]]
; AVX512-NEXT:    [[AB2:%.*]] = and i32 [[A2]], [[B2]]
; AVX512-NEXT:    [[AB3:%.*]] = and i32 [[A3]], [[B3]]
; AVX512-NEXT:    [[TMP2:%.*]] = extractelement <4 x i32> [[TMP1]], i32 0
; AVX512-NEXT:    [[R0:%.*]] = insertelement <4 x i32> undef, i32 [[TMP2]], i32 0
; AVX512-NEXT:    [[TMP3:%.*]] = extractelement <4 x i32> [[TMP1]], i32 1
; AVX512-NEXT:    [[R1:%.*]] = insertelement <4 x i32> [[R0]], i32 [[TMP3]], i32 1
; AVX512-NEXT:    [[R2:%.*]] = insertelement <4 x i32> [[R1]], i32 [[AB2]], i32 2
; AVX512-NEXT:    [[R3:%.*]] = insertelement <4 x i32> [[R2]], i32 [[AB3]], i32 3
; AVX512-NEXT:    ret <4 x i32> [[R3]]
;
  %a0 = extractelement <4 x i32> %a, i32 0
  %a1 = extractelement <4 x i32> %a, i32 1
  %a2 = extractelement <4 x i32> %a, i32 2
  %a3 = extractelement <4 x i32> %a, i32 3
  %b0 = extractelement <4 x i32> %b, i32 0
  %b1 = extractelement <4 x i32> %b, i32 1
  %b2 = extractelement <4 x i32> %b, i32 2
  %b3 = extractelement <4 x i32> %b, i32 3
  %ab0 = add i32 %a0, %b0
  %ab1 = add i32 %a1, %b1
  %ab2 = and i32 %a2, %b2
  %ab3 = and i32 %a3, %b3
  %r0 = insertelement <4 x i32> undef, i32 %ab0, i32 0
  %r1 = insertelement <4 x i32>   %r0, i32 %ab1, i32 1
  %r2 = insertelement <4 x i32>   %r1, i32 %ab2, i32 2
  %r3 = insertelement <4 x i32>   %r2, i32 %ab3, i32 3
  ret <4 x i32> %r3
}

define <4 x i32> @add_mul_v4i32(<4 x i32> %a, <4 x i32> %b) {
; CHECK-LABEL: @add_mul_v4i32(
; CHECK-NEXT:    [[A0:%.*]] = extractelement <4 x i32> [[A:%.*]], i32 0
; CHECK-NEXT:    [[A1:%.*]] = extractelement <4 x i32> [[A]], i32 1
; CHECK-NEXT:    [[A2:%.*]] = extractelement <4 x i32> [[A]], i32 2
; CHECK-NEXT:    [[A3:%.*]] = extractelement <4 x i32> [[A]], i32 3
; CHECK-NEXT:    [[B0:%.*]] = extractelement <4 x i32> [[B:%.*]], i32 0
; CHECK-NEXT:    [[B1:%.*]] = extractelement <4 x i32> [[B]], i32 1
; CHECK-NEXT:    [[B2:%.*]] = extractelement <4 x i32> [[B]], i32 2
; CHECK-NEXT:    [[B3:%.*]] = extractelement <4 x i32> [[B]], i32 3
; CHECK-NEXT:    [[AB0:%.*]] = mul i32 [[A0]], [[B0]]
; CHECK-NEXT:    [[AB1:%.*]] = add i32 [[A1]], [[B1]]
; CHECK-NEXT:    [[AB2:%.*]] = add i32 [[A2]], [[B2]]
; CHECK-NEXT:    [[AB3:%.*]] = mul i32 [[A3]], [[B3]]
; CHECK-NEXT:    [[R0:%.*]] = insertelement <4 x i32> undef, i32 [[AB0]], i32 0
; CHECK-NEXT:    [[R1:%.*]] = insertelement <4 x i32> [[R0]], i32 [[AB1]], i32 1
; CHECK-NEXT:    [[R2:%.*]] = insertelement <4 x i32> [[R1]], i32 [[AB2]], i32 2
; CHECK-NEXT:    [[R3:%.*]] = insertelement <4 x i32> [[R2]], i32 [[AB3]], i32 3
; CHECK-NEXT:    ret <4 x i32> [[R3]]
;
  %a0 = extractelement <4 x i32> %a, i32 0
  %a1 = extractelement <4 x i32> %a, i32 1
  %a2 = extractelement <4 x i32> %a, i32 2
  %a3 = extractelement <4 x i32> %a, i32 3
  %b0 = extractelement <4 x i32> %b, i32 0
  %b1 = extractelement <4 x i32> %b, i32 1
  %b2 = extractelement <4 x i32> %b, i32 2
  %b3 = extractelement <4 x i32> %b, i32 3
  %ab0 = mul i32 %a0, %b0
  %ab1 = add i32 %a1, %b1
  %ab2 = add i32 %a2, %b2
  %ab3 = mul i32 %a3, %b3
  %r0 = insertelement <4 x i32> undef, i32 %ab0, i32 0
  %r1 = insertelement <4 x i32>   %r0, i32 %ab1, i32 1
  %r2 = insertelement <4 x i32>   %r1, i32 %ab2, i32 2
  %r3 = insertelement <4 x i32>   %r2, i32 %ab3, i32 3
  ret <4 x i32> %r3
}

define <8 x i32> @ashr_shl_v8i32(<8 x i32> %a, <8 x i32> %b) {
; SSE-LABEL: @ashr_shl_v8i32(
; SSE-NEXT:    [[A0:%.*]] = extractelement <8 x i32> [[A:%.*]], i32 0
; SSE-NEXT:    [[A1:%.*]] = extractelement <8 x i32> [[A]], i32 1
; SSE-NEXT:    [[A2:%.*]] = extractelement <8 x i32> [[A]], i32 2
; SSE-NEXT:    [[A3:%.*]] = extractelement <8 x i32> [[A]], i32 3
; SSE-NEXT:    [[A4:%.*]] = extractelement <8 x i32> [[A]], i32 4
; SSE-NEXT:    [[A5:%.*]] = extractelement <8 x i32> [[A]], i32 5
; SSE-NEXT:    [[A6:%.*]] = extractelement <8 x i32> [[A]], i32 6
; SSE-NEXT:    [[A7:%.*]] = extractelement <8 x i32> [[A]], i32 7
; SSE-NEXT:    [[B0:%.*]] = extractelement <8 x i32> [[B:%.*]], i32 0
; SSE-NEXT:    [[B1:%.*]] = extractelement <8 x i32> [[B]], i32 1
; SSE-NEXT:    [[B2:%.*]] = extractelement <8 x i32> [[B]], i32 2
; SSE-NEXT:    [[B3:%.*]] = extractelement <8 x i32> [[B]], i32 3
; SSE-NEXT:    [[B4:%.*]] = extractelement <8 x i32> [[B]], i32 4
; SSE-NEXT:    [[B5:%.*]] = extractelement <8 x i32> [[B]], i32 5
; SSE-NEXT:    [[B6:%.*]] = extractelement <8 x i32> [[B]], i32 6
; SSE-NEXT:    [[B7:%.*]] = extractelement <8 x i32> [[B]], i32 7
; SSE-NEXT:    [[AB0:%.*]] = ashr i32 [[A0]], [[B0]]
; SSE-NEXT:    [[AB1:%.*]] = ashr i32 [[A1]], [[B1]]
; SSE-NEXT:    [[AB2:%.*]] = ashr i32 [[A2]], [[B2]]
; SSE-NEXT:    [[AB3:%.*]] = ashr i32 [[A3]], [[B3]]
; SSE-NEXT:    [[AB4:%.*]] = shl i32 [[A4]], [[B4]]
; SSE-NEXT:    [[AB5:%.*]] = shl i32 [[A5]], [[B5]]
; SSE-NEXT:    [[AB6:%.*]] = shl i32 [[A6]], [[B6]]
; SSE-NEXT:    [[AB7:%.*]] = shl i32 [[A7]], [[B7]]
; SSE-NEXT:    [[R0:%.*]] = insertelement <8 x i32> undef, i32 [[AB0]], i32 0
; SSE-NEXT:    [[R1:%.*]] = insertelement <8 x i32> [[R0]], i32 [[AB1]], i32 1
; SSE-NEXT:    [[R2:%.*]] = insertelement <8 x i32> [[R1]], i32 [[AB2]], i32 2
; SSE-NEXT:    [[R3:%.*]] = insertelement <8 x i32> [[R2]], i32 [[AB3]], i32 3
; SSE-NEXT:    [[R4:%.*]] = insertelement <8 x i32> [[R3]], i32 [[AB4]], i32 4
; SSE-NEXT:    [[R5:%.*]] = insertelement <8 x i32> [[R4]], i32 [[AB5]], i32 5
; SSE-NEXT:    [[R6:%.*]] = insertelement <8 x i32> [[R5]], i32 [[AB6]], i32 6
; SSE-NEXT:    [[R7:%.*]] = insertelement <8 x i32> [[R6]], i32 [[AB7]], i32 7
; SSE-NEXT:    ret <8 x i32> [[R7]]
;
; SLM-LABEL: @ashr_shl_v8i32(
; SLM-NEXT:    [[A0:%.*]] = extractelement <8 x i32> [[A:%.*]], i32 0
; SLM-NEXT:    [[A1:%.*]] = extractelement <8 x i32> [[A]], i32 1
; SLM-NEXT:    [[A2:%.*]] = extractelement <8 x i32> [[A]], i32 2
; SLM-NEXT:    [[A3:%.*]] = extractelement <8 x i32> [[A]], i32 3
; SLM-NEXT:    [[A4:%.*]] = extractelement <8 x i32> [[A]], i32 4
; SLM-NEXT:    [[A5:%.*]] = extractelement <8 x i32> [[A]], i32 5
; SLM-NEXT:    [[A6:%.*]] = extractelement <8 x i32> [[A]], i32 6
; SLM-NEXT:    [[A7:%.*]] = extractelement <8 x i32> [[A]], i32 7
; SLM-NEXT:    [[B0:%.*]] = extractelement <8 x i32> [[B:%.*]], i32 0
; SLM-NEXT:    [[B1:%.*]] = extractelement <8 x i32> [[B]], i32 1
; SLM-NEXT:    [[B2:%.*]] = extractelement <8 x i32> [[B]], i32 2
; SLM-NEXT:    [[B3:%.*]] = extractelement <8 x i32> [[B]], i32 3
; SLM-NEXT:    [[B4:%.*]] = extractelement <8 x i32> [[B]], i32 4
; SLM-NEXT:    [[B5:%.*]] = extractelement <8 x i32> [[B]], i32 5
; SLM-NEXT:    [[B6:%.*]] = extractelement <8 x i32> [[B]], i32 6
; SLM-NEXT:    [[B7:%.*]] = extractelement <8 x i32> [[B]], i32 7
; SLM-NEXT:    [[AB0:%.*]] = ashr i32 [[A0]], [[B0]]
; SLM-NEXT:    [[AB1:%.*]] = ashr i32 [[A1]], [[B1]]
; SLM-NEXT:    [[AB2:%.*]] = ashr i32 [[A2]], [[B2]]
; SLM-NEXT:    [[AB3:%.*]] = ashr i32 [[A3]], [[B3]]
; SLM-NEXT:    [[AB4:%.*]] = shl i32 [[A4]], [[B4]]
; SLM-NEXT:    [[AB5:%.*]] = shl i32 [[A5]], [[B5]]
; SLM-NEXT:    [[AB6:%.*]] = shl i32 [[A6]], [[B6]]
; SLM-NEXT:    [[AB7:%.*]] = shl i32 [[A7]], [[B7]]
; SLM-NEXT:    [[R0:%.*]] = insertelement <8 x i32> undef, i32 [[AB0]], i32 0
; SLM-NEXT:    [[R1:%.*]] = insertelement <8 x i32> [[R0]], i32 [[AB1]], i32 1
; SLM-NEXT:    [[R2:%.*]] = insertelement <8 x i32> [[R1]], i32 [[AB2]], i32 2
; SLM-NEXT:    [[R3:%.*]] = insertelement <8 x i32> [[R2]], i32 [[AB3]], i32 3
; SLM-NEXT:    [[R4:%.*]] = insertelement <8 x i32> [[R3]], i32 [[AB4]], i32 4
; SLM-NEXT:    [[R5:%.*]] = insertelement <8 x i32> [[R4]], i32 [[AB5]], i32 5
; SLM-NEXT:    [[R6:%.*]] = insertelement <8 x i32> [[R5]], i32 [[AB6]], i32 6
; SLM-NEXT:    [[R7:%.*]] = insertelement <8 x i32> [[R6]], i32 [[AB7]], i32 7
; SLM-NEXT:    ret <8 x i32> [[R7]]
;
; AVX1-LABEL: @ashr_shl_v8i32(
; AVX1-NEXT:    [[A0:%.*]] = extractelement <8 x i32> [[A:%.*]], i32 0
; AVX1-NEXT:    [[A1:%.*]] = extractelement <8 x i32> [[A]], i32 1
; AVX1-NEXT:    [[A2:%.*]] = extractelement <8 x i32> [[A]], i32 2
; AVX1-NEXT:    [[A3:%.*]] = extractelement <8 x i32> [[A]], i32 3
; AVX1-NEXT:    [[A4:%.*]] = extractelement <8 x i32> [[A]], i32 4
; AVX1-NEXT:    [[A5:%.*]] = extractelement <8 x i32> [[A]], i32 5
; AVX1-NEXT:    [[A6:%.*]] = extractelement <8 x i32> [[A]], i32 6
; AVX1-NEXT:    [[A7:%.*]] = extractelement <8 x i32> [[A]], i32 7
; AVX1-NEXT:    [[B0:%.*]] = extractelement <8 x i32> [[B:%.*]], i32 0
; AVX1-NEXT:    [[B1:%.*]] = extractelement <8 x i32> [[B]], i32 1
; AVX1-NEXT:    [[B2:%.*]] = extractelement <8 x i32> [[B]], i32 2
; AVX1-NEXT:    [[B3:%.*]] = extractelement <8 x i32> [[B]], i32 3
; AVX1-NEXT:    [[B4:%.*]] = extractelement <8 x i32> [[B]], i32 4
; AVX1-NEXT:    [[B5:%.*]] = extractelement <8 x i32> [[B]], i32 5
; AVX1-NEXT:    [[B6:%.*]] = extractelement <8 x i32> [[B]], i32 6
; AVX1-NEXT:    [[B7:%.*]] = extractelement <8 x i32> [[B]], i32 7
; AVX1-NEXT:    [[AB0:%.*]] = ashr i32 [[A0]], [[B0]]
; AVX1-NEXT:    [[AB1:%.*]] = ashr i32 [[A1]], [[B1]]
; AVX1-NEXT:    [[AB2:%.*]] = ashr i32 [[A2]], [[B2]]
; AVX1-NEXT:    [[AB3:%.*]] = ashr i32 [[A3]], [[B3]]
; AVX1-NEXT:    [[AB4:%.*]] = shl i32 [[A4]], [[B4]]
; AVX1-NEXT:    [[AB5:%.*]] = shl i32 [[A5]], [[B5]]
; AVX1-NEXT:    [[AB6:%.*]] = shl i32 [[A6]], [[B6]]
; AVX1-NEXT:    [[AB7:%.*]] = shl i32 [[A7]], [[B7]]
; AVX1-NEXT:    [[R0:%.*]] = insertelement <8 x i32> undef, i32 [[AB0]], i32 0
; AVX1-NEXT:    [[R1:%.*]] = insertelement <8 x i32> [[R0]], i32 [[AB1]], i32 1
; AVX1-NEXT:    [[R2:%.*]] = insertelement <8 x i32> [[R1]], i32 [[AB2]], i32 2
; AVX1-NEXT:    [[R3:%.*]] = insertelement <8 x i32> [[R2]], i32 [[AB3]], i32 3
; AVX1-NEXT:    [[R4:%.*]] = insertelement <8 x i32> [[R3]], i32 [[AB4]], i32 4
; AVX1-NEXT:    [[R5:%.*]] = insertelement <8 x i32> [[R4]], i32 [[AB5]], i32 5
; AVX1-NEXT:    [[R6:%.*]] = insertelement <8 x i32> [[R5]], i32 [[AB6]], i32 6
; AVX1-NEXT:    [[R7:%.*]] = insertelement <8 x i32> [[R6]], i32 [[AB7]], i32 7
; AVX1-NEXT:    ret <8 x i32> [[R7]]
;
; AVX2-LABEL: @ashr_shl_v8i32(
; AVX2-NEXT:    [[A4:%.*]] = extractelement <8 x i32> [[A:%.*]], i32 4
; AVX2-NEXT:    [[A5:%.*]] = extractelement <8 x i32> [[A]], i32 5
; AVX2-NEXT:    [[A6:%.*]] = extractelement <8 x i32> [[A]], i32 6
; AVX2-NEXT:    [[A7:%.*]] = extractelement <8 x i32> [[A]], i32 7
; AVX2-NEXT:    [[B4:%.*]] = extractelement <8 x i32> [[B:%.*]], i32 4
; AVX2-NEXT:    [[B5:%.*]] = extractelement <8 x i32> [[B]], i32 5
; AVX2-NEXT:    [[B6:%.*]] = extractelement <8 x i32> [[B]], i32 6
; AVX2-NEXT:    [[B7:%.*]] = extractelement <8 x i32> [[B]], i32 7
; AVX2-NEXT:    [[TMP1:%.*]] = ashr <8 x i32> [[A]], [[B]]
; AVX2-NEXT:    [[AB4:%.*]] = shl i32 [[A4]], [[B4]]
; AVX2-NEXT:    [[AB5:%.*]] = shl i32 [[A5]], [[B5]]
; AVX2-NEXT:    [[AB6:%.*]] = shl i32 [[A6]], [[B6]]
; AVX2-NEXT:    [[AB7:%.*]] = shl i32 [[A7]], [[B7]]
; AVX2-NEXT:    [[TMP2:%.*]] = extractelement <8 x i32> [[TMP1]], i32 0
; AVX2-NEXT:    [[R0:%.*]] = insertelement <8 x i32> undef, i32 [[TMP2]], i32 0
; AVX2-NEXT:    [[TMP3:%.*]] = extractelement <8 x i32> [[TMP1]], i32 1
; AVX2-NEXT:    [[R1:%.*]] = insertelement <8 x i32> [[R0]], i32 [[TMP3]], i32 1
; AVX2-NEXT:    [[TMP4:%.*]] = extractelement <8 x i32> [[TMP1]], i32 2
; AVX2-NEXT:    [[R2:%.*]] = insertelement <8 x i32> [[R1]], i32 [[TMP4]], i32 2
; AVX2-NEXT:    [[TMP5:%.*]] = extractelement <8 x i32> [[TMP1]], i32 3
; AVX2-NEXT:    [[R3:%.*]] = insertelement <8 x i32> [[R2]], i32 [[TMP5]], i32 3
; AVX2-NEXT:    [[R4:%.*]] = insertelement <8 x i32> [[R3]], i32 [[AB4]], i32 4
; AVX2-NEXT:    [[R5:%.*]] = insertelement <8 x i32> [[R4]], i32 [[AB5]], i32 5
; AVX2-NEXT:    [[R6:%.*]] = insertelement <8 x i32> [[R5]], i32 [[AB6]], i32 6
; AVX2-NEXT:    [[R7:%.*]] = insertelement <8 x i32> [[R6]], i32 [[AB7]], i32 7
; AVX2-NEXT:    ret <8 x i32> [[R7]]
;
; AVX512-LABEL: @ashr_shl_v8i32(
; AVX512-NEXT:    [[A4:%.*]] = extractelement <8 x i32> [[A:%.*]], i32 4
; AVX512-NEXT:    [[A5:%.*]] = extractelement <8 x i32> [[A]], i32 5
; AVX512-NEXT:    [[A6:%.*]] = extractelement <8 x i32> [[A]], i32 6
; AVX512-NEXT:    [[A7:%.*]] = extractelement <8 x i32> [[A]], i32 7
; AVX512-NEXT:    [[B4:%.*]] = extractelement <8 x i32> [[B:%.*]], i32 4
; AVX512-NEXT:    [[B5:%.*]] = extractelement <8 x i32> [[B]], i32 5
; AVX512-NEXT:    [[B6:%.*]] = extractelement <8 x i32> [[B]], i32 6
; AVX512-NEXT:    [[B7:%.*]] = extractelement <8 x i32> [[B]], i32 7
; AVX512-NEXT:    [[TMP1:%.*]] = ashr <8 x i32> [[A]], [[B]]
; AVX512-NEXT:    [[AB4:%.*]] = shl i32 [[A4]], [[B4]]
; AVX512-NEXT:    [[AB5:%.*]] = shl i32 [[A5]], [[B5]]
; AVX512-NEXT:    [[AB6:%.*]] = shl i32 [[A6]], [[B6]]
; AVX512-NEXT:    [[AB7:%.*]] = shl i32 [[A7]], [[B7]]
; AVX512-NEXT:    [[TMP2:%.*]] = extractelement <8 x i32> [[TMP1]], i32 0
; AVX512-NEXT:    [[R0:%.*]] = insertelement <8 x i32> undef, i32 [[TMP2]], i32 0
; AVX512-NEXT:    [[TMP3:%.*]] = extractelement <8 x i32> [[TMP1]], i32 1
; AVX512-NEXT:    [[R1:%.*]] = insertelement <8 x i32> [[R0]], i32 [[TMP3]], i32 1
; AVX512-NEXT:    [[TMP4:%.*]] = extractelement <8 x i32> [[TMP1]], i32 2
; AVX512-NEXT:    [[R2:%.*]] = insertelement <8 x i32> [[R1]], i32 [[TMP4]], i32 2
; AVX512-NEXT:    [[TMP5:%.*]] = extractelement <8 x i32> [[TMP1]], i32 3
; AVX512-NEXT:    [[R3:%.*]] = insertelement <8 x i32> [[R2]], i32 [[TMP5]], i32 3
; AVX512-NEXT:    [[R4:%.*]] = insertelement <8 x i32> [[R3]], i32 [[AB4]], i32 4
; AVX512-NEXT:    [[R5:%.*]] = insertelement <8 x i32> [[R4]], i32 [[AB5]], i32 5
; AVX512-NEXT:    [[R6:%.*]] = insertelement <8 x i32> [[R5]], i32 [[AB6]], i32 6
; AVX512-NEXT:    [[R7:%.*]] = insertelement <8 x i32> [[R6]], i32 [[AB7]], i32 7
; AVX512-NEXT:    ret <8 x i32> [[R7]]
;
  %a0 = extractelement <8 x i32> %a, i32 0
  %a1 = extractelement <8 x i32> %a, i32 1
  %a2 = extractelement <8 x i32> %a, i32 2
  %a3 = extractelement <8 x i32> %a, i32 3
  %a4 = extractelement <8 x i32> %a, i32 4
  %a5 = extractelement <8 x i32> %a, i32 5
  %a6 = extractelement <8 x i32> %a, i32 6
  %a7 = extractelement <8 x i32> %a, i32 7
  %b0 = extractelement <8 x i32> %b, i32 0
  %b1 = extractelement <8 x i32> %b, i32 1
  %b2 = extractelement <8 x i32> %b, i32 2
  %b3 = extractelement <8 x i32> %b, i32 3
  %b4 = extractelement <8 x i32> %b, i32 4
  %b5 = extractelement <8 x i32> %b, i32 5
  %b6 = extractelement <8 x i32> %b, i32 6
  %b7 = extractelement <8 x i32> %b, i32 7
  %ab0 = ashr i32 %a0, %b0
  %ab1 = ashr i32 %a1, %b1
  %ab2 = ashr i32 %a2, %b2
  %ab3 = ashr i32 %a3, %b3
  %ab4 = shl  i32 %a4, %b4
  %ab5 = shl  i32 %a5, %b5
  %ab6 = shl  i32 %a6, %b6
  %ab7 = shl  i32 %a7, %b7
  %r0 = insertelement <8 x i32> undef, i32 %ab0, i32 0
  %r1 = insertelement <8 x i32>   %r0, i32 %ab1, i32 1
  %r2 = insertelement <8 x i32>   %r1, i32 %ab2, i32 2
  %r3 = insertelement <8 x i32>   %r2, i32 %ab3, i32 3
  %r4 = insertelement <8 x i32>   %r3, i32 %ab4, i32 4
  %r5 = insertelement <8 x i32>   %r4, i32 %ab5, i32 5
  %r6 = insertelement <8 x i32>   %r5, i32 %ab6, i32 6
  %r7 = insertelement <8 x i32>   %r6, i32 %ab7, i32 7
  ret <8 x i32> %r7
}

define <8 x i32> @ashr_shl_v8i32_const(<8 x i32> %a) {
; CHECK-LABEL: @ashr_shl_v8i32_const(
; CHECK-NEXT:    [[A4:%.*]] = extractelement <8 x i32> [[A:%.*]], i32 4
; CHECK-NEXT:    [[A5:%.*]] = extractelement <8 x i32> [[A]], i32 5
; CHECK-NEXT:    [[A6:%.*]] = extractelement <8 x i32> [[A]], i32 6
; CHECK-NEXT:    [[A7:%.*]] = extractelement <8 x i32> [[A]], i32 7
; CHECK-NEXT:    [[TMP1:%.*]] = shufflevector <8 x i32> [[A]], <8 x i32> undef, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
; CHECK-NEXT:    [[TMP2:%.*]] = ashr <4 x i32> [[TMP1]], <i32 2, i32 2, i32 2, i32 2>
; CHECK-NEXT:    [[AB4:%.*]] = shl i32 [[A4]], 3
; CHECK-NEXT:    [[AB5:%.*]] = shl i32 [[A5]], 3
; CHECK-NEXT:    [[AB6:%.*]] = shl i32 [[A6]], 3
; CHECK-NEXT:    [[AB7:%.*]] = shl i32 [[A7]], 3
; CHECK-NEXT:    [[TMP3:%.*]] = extractelement <4 x i32> [[TMP2]], i32 0
; CHECK-NEXT:    [[R0:%.*]] = insertelement <8 x i32> undef, i32 [[TMP3]], i32 0
; CHECK-NEXT:    [[TMP4:%.*]] = extractelement <4 x i32> [[TMP2]], i32 1
; CHECK-NEXT:    [[R1:%.*]] = insertelement <8 x i32> [[R0]], i32 [[TMP4]], i32 1
; CHECK-NEXT:    [[TMP5:%.*]] = extractelement <4 x i32> [[TMP2]], i32 2
; CHECK-NEXT:    [[R2:%.*]] = insertelement <8 x i32> [[R1]], i32 [[TMP5]], i32 2
; CHECK-NEXT:    [[TMP6:%.*]] = extractelement <4 x i32> [[TMP2]], i32 3
; CHECK-NEXT:    [[R3:%.*]] = insertelement <8 x i32> [[R2]], i32 [[TMP6]], i32 3
; CHECK-NEXT:    [[R4:%.*]] = insertelement <8 x i32> [[R3]], i32 [[AB4]], i32 4
; CHECK-NEXT:    [[R5:%.*]] = insertelement <8 x i32> [[R4]], i32 [[AB5]], i32 5
; CHECK-NEXT:    [[R6:%.*]] = insertelement <8 x i32> [[R5]], i32 [[AB6]], i32 6
; CHECK-NEXT:    [[R7:%.*]] = insertelement <8 x i32> [[R6]], i32 [[AB7]], i32 7
; CHECK-NEXT:    ret <8 x i32> [[R7]]
;
  %a0 = extractelement <8 x i32> %a, i32 0
  %a1 = extractelement <8 x i32> %a, i32 1
  %a2 = extractelement <8 x i32> %a, i32 2
  %a3 = extractelement <8 x i32> %a, i32 3
  %a4 = extractelement <8 x i32> %a, i32 4
  %a5 = extractelement <8 x i32> %a, i32 5
  %a6 = extractelement <8 x i32> %a, i32 6
  %a7 = extractelement <8 x i32> %a, i32 7
  %ab0 = ashr i32 %a0, 2
  %ab1 = ashr i32 %a1, 2
  %ab2 = ashr i32 %a2, 2
  %ab3 = ashr i32 %a3, 2
  %ab4 = shl  i32 %a4, 3
  %ab5 = shl  i32 %a5, 3
  %ab6 = shl  i32 %a6, 3
  %ab7 = shl  i32 %a7, 3
  %r0 = insertelement <8 x i32> undef, i32 %ab0, i32 0
  %r1 = insertelement <8 x i32>   %r0, i32 %ab1, i32 1
  %r2 = insertelement <8 x i32>   %r1, i32 %ab2, i32 2
  %r3 = insertelement <8 x i32>   %r2, i32 %ab3, i32 3
  %r4 = insertelement <8 x i32>   %r3, i32 %ab4, i32 4
  %r5 = insertelement <8 x i32>   %r4, i32 %ab5, i32 5
  %r6 = insertelement <8 x i32>   %r5, i32 %ab6, i32 6
  %r7 = insertelement <8 x i32>   %r6, i32 %ab7, i32 7
  ret <8 x i32> %r7
}

define <8 x i32> @ashr_lshr_shl_v8i32(<8 x i32> %a, <8 x i32> %b) {
; SSE-LABEL: @ashr_lshr_shl_v8i32(
; SSE-NEXT:    [[A0:%.*]] = extractelement <8 x i32> [[A:%.*]], i32 0
; SSE-NEXT:    [[A1:%.*]] = extractelement <8 x i32> [[A]], i32 1
; SSE-NEXT:    [[A2:%.*]] = extractelement <8 x i32> [[A]], i32 2
; SSE-NEXT:    [[A3:%.*]] = extractelement <8 x i32> [[A]], i32 3
; SSE-NEXT:    [[A4:%.*]] = extractelement <8 x i32> [[A]], i32 4
; SSE-NEXT:    [[A5:%.*]] = extractelement <8 x i32> [[A]], i32 5
; SSE-NEXT:    [[A6:%.*]] = extractelement <8 x i32> [[A]], i32 6
; SSE-NEXT:    [[A7:%.*]] = extractelement <8 x i32> [[A]], i32 7
; SSE-NEXT:    [[B0:%.*]] = extractelement <8 x i32> [[B:%.*]], i32 0
; SSE-NEXT:    [[B1:%.*]] = extractelement <8 x i32> [[B]], i32 1
; SSE-NEXT:    [[B2:%.*]] = extractelement <8 x i32> [[B]], i32 2
; SSE-NEXT:    [[B3:%.*]] = extractelement <8 x i32> [[B]], i32 3
; SSE-NEXT:    [[B4:%.*]] = extractelement <8 x i32> [[B]], i32 4
; SSE-NEXT:    [[B5:%.*]] = extractelement <8 x i32> [[B]], i32 5
; SSE-NEXT:    [[B6:%.*]] = extractelement <8 x i32> [[B]], i32 6
; SSE-NEXT:    [[B7:%.*]] = extractelement <8 x i32> [[B]], i32 7
; SSE-NEXT:    [[AB0:%.*]] = ashr i32 [[A0]], [[B0]]
; SSE-NEXT:    [[AB1:%.*]] = ashr i32 [[A1]], [[B1]]
; SSE-NEXT:    [[AB2:%.*]] = lshr i32 [[A2]], [[B2]]
; SSE-NEXT:    [[AB3:%.*]] = lshr i32 [[A3]], [[B3]]
; SSE-NEXT:    [[AB4:%.*]] = lshr i32 [[A4]], [[B4]]
; SSE-NEXT:    [[AB5:%.*]] = lshr i32 [[A5]], [[B5]]
; SSE-NEXT:    [[AB6:%.*]] = shl i32 [[A6]], [[B6]]
; SSE-NEXT:    [[AB7:%.*]] = shl i32 [[A7]], [[B7]]
; SSE-NEXT:    [[R0:%.*]] = insertelement <8 x i32> undef, i32 [[AB0]], i32 0
; SSE-NEXT:    [[R1:%.*]] = insertelement <8 x i32> [[R0]], i32 [[AB1]], i32 1
; SSE-NEXT:    [[R2:%.*]] = insertelement <8 x i32> [[R1]], i32 [[AB2]], i32 2
; SSE-NEXT:    [[R3:%.*]] = insertelement <8 x i32> [[R2]], i32 [[AB3]], i32 3
; SSE-NEXT:    [[R4:%.*]] = insertelement <8 x i32> [[R3]], i32 [[AB4]], i32 4
; SSE-NEXT:    [[R5:%.*]] = insertelement <8 x i32> [[R4]], i32 [[AB5]], i32 5
; SSE-NEXT:    [[R6:%.*]] = insertelement <8 x i32> [[R5]], i32 [[AB6]], i32 6
; SSE-NEXT:    [[R7:%.*]] = insertelement <8 x i32> [[R6]], i32 [[AB7]], i32 7
; SSE-NEXT:    ret <8 x i32> [[R7]]
;
; SLM-LABEL: @ashr_lshr_shl_v8i32(
; SLM-NEXT:    [[A0:%.*]] = extractelement <8 x i32> [[A:%.*]], i32 0
; SLM-NEXT:    [[A1:%.*]] = extractelement <8 x i32> [[A]], i32 1
; SLM-NEXT:    [[A2:%.*]] = extractelement <8 x i32> [[A]], i32 2
; SLM-NEXT:    [[A3:%.*]] = extractelement <8 x i32> [[A]], i32 3
; SLM-NEXT:    [[A4:%.*]] = extractelement <8 x i32> [[A]], i32 4
; SLM-NEXT:    [[A5:%.*]] = extractelement <8 x i32> [[A]], i32 5
; SLM-NEXT:    [[A6:%.*]] = extractelement <8 x i32> [[A]], i32 6
; SLM-NEXT:    [[A7:%.*]] = extractelement <8 x i32> [[A]], i32 7
; SLM-NEXT:    [[B0:%.*]] = extractelement <8 x i32> [[B:%.*]], i32 0
; SLM-NEXT:    [[B1:%.*]] = extractelement <8 x i32> [[B]], i32 1
; SLM-NEXT:    [[B2:%.*]] = extractelement <8 x i32> [[B]], i32 2
; SLM-NEXT:    [[B3:%.*]] = extractelement <8 x i32> [[B]], i32 3
; SLM-NEXT:    [[B4:%.*]] = extractelement <8 x i32> [[B]], i32 4
; SLM-NEXT:    [[B5:%.*]] = extractelement <8 x i32> [[B]], i32 5
; SLM-NEXT:    [[B6:%.*]] = extractelement <8 x i32> [[B]], i32 6
; SLM-NEXT:    [[B7:%.*]] = extractelement <8 x i32> [[B]], i32 7
; SLM-NEXT:    [[AB0:%.*]] = ashr i32 [[A0]], [[B0]]
; SLM-NEXT:    [[AB1:%.*]] = ashr i32 [[A1]], [[B1]]
; SLM-NEXT:    [[AB2:%.*]] = lshr i32 [[A2]], [[B2]]
; SLM-NEXT:    [[AB3:%.*]] = lshr i32 [[A3]], [[B3]]
; SLM-NEXT:    [[AB4:%.*]] = lshr i32 [[A4]], [[B4]]
; SLM-NEXT:    [[AB5:%.*]] = lshr i32 [[A5]], [[B5]]
; SLM-NEXT:    [[AB6:%.*]] = shl i32 [[A6]], [[B6]]
; SLM-NEXT:    [[AB7:%.*]] = shl i32 [[A7]], [[B7]]
; SLM-NEXT:    [[R0:%.*]] = insertelement <8 x i32> undef, i32 [[AB0]], i32 0
; SLM-NEXT:    [[R1:%.*]] = insertelement <8 x i32> [[R0]], i32 [[AB1]], i32 1
; SLM-NEXT:    [[R2:%.*]] = insertelement <8 x i32> [[R1]], i32 [[AB2]], i32 2
; SLM-NEXT:    [[R3:%.*]] = insertelement <8 x i32> [[R2]], i32 [[AB3]], i32 3
; SLM-NEXT:    [[R4:%.*]] = insertelement <8 x i32> [[R3]], i32 [[AB4]], i32 4
; SLM-NEXT:    [[R5:%.*]] = insertelement <8 x i32> [[R4]], i32 [[AB5]], i32 5
; SLM-NEXT:    [[R6:%.*]] = insertelement <8 x i32> [[R5]], i32 [[AB6]], i32 6
; SLM-NEXT:    [[R7:%.*]] = insertelement <8 x i32> [[R6]], i32 [[AB7]], i32 7
; SLM-NEXT:    ret <8 x i32> [[R7]]
;
; AVX-LABEL: @ashr_lshr_shl_v8i32(
; AVX-NEXT:    [[A0:%.*]] = extractelement <8 x i32> [[A:%.*]], i32 0
; AVX-NEXT:    [[A1:%.*]] = extractelement <8 x i32> [[A]], i32 1
; AVX-NEXT:    [[A2:%.*]] = extractelement <8 x i32> [[A]], i32 2
; AVX-NEXT:    [[A3:%.*]] = extractelement <8 x i32> [[A]], i32 3
; AVX-NEXT:    [[A4:%.*]] = extractelement <8 x i32> [[A]], i32 4
; AVX-NEXT:    [[A5:%.*]] = extractelement <8 x i32> [[A]], i32 5
; AVX-NEXT:    [[A6:%.*]] = extractelement <8 x i32> [[A]], i32 6
; AVX-NEXT:    [[A7:%.*]] = extractelement <8 x i32> [[A]], i32 7
; AVX-NEXT:    [[B0:%.*]] = extractelement <8 x i32> [[B:%.*]], i32 0
; AVX-NEXT:    [[B1:%.*]] = extractelement <8 x i32> [[B]], i32 1
; AVX-NEXT:    [[B2:%.*]] = extractelement <8 x i32> [[B]], i32 2
; AVX-NEXT:    [[B3:%.*]] = extractelement <8 x i32> [[B]], i32 3
; AVX-NEXT:    [[B4:%.*]] = extractelement <8 x i32> [[B]], i32 4
; AVX-NEXT:    [[B5:%.*]] = extractelement <8 x i32> [[B]], i32 5
; AVX-NEXT:    [[B6:%.*]] = extractelement <8 x i32> [[B]], i32 6
; AVX-NEXT:    [[B7:%.*]] = extractelement <8 x i32> [[B]], i32 7
; AVX-NEXT:    [[AB0:%.*]] = ashr i32 [[A0]], [[B0]]
; AVX-NEXT:    [[AB1:%.*]] = ashr i32 [[A1]], [[B1]]
; AVX-NEXT:    [[AB2:%.*]] = lshr i32 [[A2]], [[B2]]
; AVX-NEXT:    [[AB3:%.*]] = lshr i32 [[A3]], [[B3]]
; AVX-NEXT:    [[AB4:%.*]] = lshr i32 [[A4]], [[B4]]
; AVX-NEXT:    [[AB5:%.*]] = lshr i32 [[A5]], [[B5]]
; AVX-NEXT:    [[AB6:%.*]] = shl i32 [[A6]], [[B6]]
; AVX-NEXT:    [[AB7:%.*]] = shl i32 [[A7]], [[B7]]
; AVX-NEXT:    [[R0:%.*]] = insertelement <8 x i32> undef, i32 [[AB0]], i32 0
; AVX-NEXT:    [[R1:%.*]] = insertelement <8 x i32> [[R0]], i32 [[AB1]], i32 1
; AVX-NEXT:    [[R2:%.*]] = insertelement <8 x i32> [[R1]], i32 [[AB2]], i32 2
; AVX-NEXT:    [[R3:%.*]] = insertelement <8 x i32> [[R2]], i32 [[AB3]], i32 3
; AVX-NEXT:    [[R4:%.*]] = insertelement <8 x i32> [[R3]], i32 [[AB4]], i32 4
; AVX-NEXT:    [[R5:%.*]] = insertelement <8 x i32> [[R4]], i32 [[AB5]], i32 5
; AVX-NEXT:    [[R6:%.*]] = insertelement <8 x i32> [[R5]], i32 [[AB6]], i32 6
; AVX-NEXT:    [[R7:%.*]] = insertelement <8 x i32> [[R6]], i32 [[AB7]], i32 7
; AVX-NEXT:    ret <8 x i32> [[R7]]
;
; AVX512-LABEL: @ashr_lshr_shl_v8i32(
; AVX512-NEXT:    [[A2:%.*]] = extractelement <8 x i32> [[A:%.*]], i32 2
; AVX512-NEXT:    [[A3:%.*]] = extractelement <8 x i32> [[A]], i32 3
; AVX512-NEXT:    [[A4:%.*]] = extractelement <8 x i32> [[A]], i32 4
; AVX512-NEXT:    [[A5:%.*]] = extractelement <8 x i32> [[A]], i32 5
; AVX512-NEXT:    [[A6:%.*]] = extractelement <8 x i32> [[A]], i32 6
; AVX512-NEXT:    [[A7:%.*]] = extractelement <8 x i32> [[A]], i32 7
; AVX512-NEXT:    [[B2:%.*]] = extractelement <8 x i32> [[B:%.*]], i32 2
; AVX512-NEXT:    [[B3:%.*]] = extractelement <8 x i32> [[B]], i32 3
; AVX512-NEXT:    [[B4:%.*]] = extractelement <8 x i32> [[B]], i32 4
; AVX512-NEXT:    [[B5:%.*]] = extractelement <8 x i32> [[B]], i32 5
; AVX512-NEXT:    [[B6:%.*]] = extractelement <8 x i32> [[B]], i32 6
; AVX512-NEXT:    [[B7:%.*]] = extractelement <8 x i32> [[B]], i32 7
; AVX512-NEXT:    [[TMP1:%.*]] = ashr <8 x i32> [[A]], [[B]]
; AVX512-NEXT:    [[AB2:%.*]] = lshr i32 [[A2]], [[B2]]
; AVX512-NEXT:    [[AB3:%.*]] = lshr i32 [[A3]], [[B3]]
; AVX512-NEXT:    [[AB4:%.*]] = lshr i32 [[A4]], [[B4]]
; AVX512-NEXT:    [[AB5:%.*]] = lshr i32 [[A5]], [[B5]]
; AVX512-NEXT:    [[AB6:%.*]] = shl i32 [[A6]], [[B6]]
; AVX512-NEXT:    [[AB7:%.*]] = shl i32 [[A7]], [[B7]]
; AVX512-NEXT:    [[TMP2:%.*]] = extractelement <8 x i32> [[TMP1]], i32 0
; AVX512-NEXT:    [[R0:%.*]] = insertelement <8 x i32> undef, i32 [[TMP2]], i32 0
; AVX512-NEXT:    [[TMP3:%.*]] = extractelement <8 x i32> [[TMP1]], i32 1
; AVX512-NEXT:    [[R1:%.*]] = insertelement <8 x i32> [[R0]], i32 [[TMP3]], i32 1
; AVX512-NEXT:    [[R2:%.*]] = insertelement <8 x i32> [[R1]], i32 [[AB2]], i32 2
; AVX512-NEXT:    [[R3:%.*]] = insertelement <8 x i32> [[R2]], i32 [[AB3]], i32 3
; AVX512-NEXT:    [[R4:%.*]] = insertelement <8 x i32> [[R3]], i32 [[AB4]], i32 4
; AVX512-NEXT:    [[R5:%.*]] = insertelement <8 x i32> [[R4]], i32 [[AB5]], i32 5
; AVX512-NEXT:    [[R6:%.*]] = insertelement <8 x i32> [[R5]], i32 [[AB6]], i32 6
; AVX512-NEXT:    [[R7:%.*]] = insertelement <8 x i32> [[R6]], i32 [[AB7]], i32 7
; AVX512-NEXT:    ret <8 x i32> [[R7]]
;
  %a0 = extractelement <8 x i32> %a, i32 0
  %a1 = extractelement <8 x i32> %a, i32 1
  %a2 = extractelement <8 x i32> %a, i32 2
  %a3 = extractelement <8 x i32> %a, i32 3
  %a4 = extractelement <8 x i32> %a, i32 4
  %a5 = extractelement <8 x i32> %a, i32 5
  %a6 = extractelement <8 x i32> %a, i32 6
  %a7 = extractelement <8 x i32> %a, i32 7
  %b0 = extractelement <8 x i32> %b, i32 0
  %b1 = extractelement <8 x i32> %b, i32 1
  %b2 = extractelement <8 x i32> %b, i32 2
  %b3 = extractelement <8 x i32> %b, i32 3
  %b4 = extractelement <8 x i32> %b, i32 4
  %b5 = extractelement <8 x i32> %b, i32 5
  %b6 = extractelement <8 x i32> %b, i32 6
  %b7 = extractelement <8 x i32> %b, i32 7
  %ab0 = ashr i32 %a0, %b0
  %ab1 = ashr i32 %a1, %b1
  %ab2 = lshr i32 %a2, %b2
  %ab3 = lshr i32 %a3, %b3
  %ab4 = lshr i32 %a4, %b4
  %ab5 = lshr i32 %a5, %b5
  %ab6 = shl  i32 %a6, %b6
  %ab7 = shl  i32 %a7, %b7
  %r0 = insertelement <8 x i32> undef, i32 %ab0, i32 0
  %r1 = insertelement <8 x i32>   %r0, i32 %ab1, i32 1
  %r2 = insertelement <8 x i32>   %r1, i32 %ab2, i32 2
  %r3 = insertelement <8 x i32>   %r2, i32 %ab3, i32 3
  %r4 = insertelement <8 x i32>   %r3, i32 %ab4, i32 4
  %r5 = insertelement <8 x i32>   %r4, i32 %ab5, i32 5
  %r6 = insertelement <8 x i32>   %r5, i32 %ab6, i32 6
  %r7 = insertelement <8 x i32>   %r6, i32 %ab7, i32 7
  ret <8 x i32> %r7
}
