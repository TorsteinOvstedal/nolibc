;; Platform: x64, Linux (6.8.1)
;;
;; Entrypoint of the program.
;; - Prepares the runtime environment for C.
;; - calls main(argc, argv).
;; - Exits the process.

bits 64

section .text
extern main
extern exit
global _start

_start:
  ; mark deepest stack frame (system v).
  xor ebp, ebp

  ; argc & argv (system v).
  pop rdi
  mov rsi, rsp

  ; align stack (system v).
  and rsp, 0xfffffffffffffff0

  ; enter C program.
  call main

  ; exit (linux).
  call exit
  hlt
