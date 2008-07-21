// RUN: clang -fsyntax-only -verify %s

int foo() {
  int a;
  __builtin_prefetch(&a);
  __builtin_prefetch(&a, 1);
  __builtin_prefetch(&a, 1, 2);
  __builtin_prefetch(&a, 1, 9, 3); // expected-error{{too many arguments to function}}, expected-error{{argument should be a value from 0 to 3}}
  __builtin_prefetch(&a, "hello", 2); // expected-error{{argument to __builtin_prefetch must be a constant integer}}
  __builtin_prefetch(&a, 2); // expected-error{{argument should be a value from 0 to 1}}
  __builtin_prefetch(&a, 0, 4); // expected-error{{argument should be a value from 0 to 3}}
  __builtin_prefetch(&a, -1, 4); // expected-error{{argument should be a value from 0 to 1}}, expected-error{{argument should be a value from 0 to 3}}
}
