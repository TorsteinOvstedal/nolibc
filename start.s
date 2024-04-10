; Entrypoint of the program.
; - Prepares the runtime environment for C.
; - calls main(argc, argv).
; - Exits the process.

bits 64

section .text
extern main
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
  mov edi, eax
  mov eax, 0x3c
  syscall
  hlt
