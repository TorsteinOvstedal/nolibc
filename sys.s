;; Platform: x64, Linux (6.8.1)
;;
;; Interface with the operating system.

bits 64

section .text
global system
global exit 
global write 

SYS_WRITE equ 0x01
SYS_EXIT  equ 0x3c

;; Invokes the specified system call.
;;
;; Parameters:
;; - rdi: system call number.
;; - ...: system call arguments.

system:
  mov rax, rdi ; system call id.
  mov rdi, rsi ; system call arguments.
  mov rsi, rdx
  mov rdx, rcx
  mov r10, r8
  mov r8, r9
  mov r9, [rsp + 8]
  syscall
  ret

; System call wrappers

;; Terminates the current process.
;; 
;; Parameters:
;; - rdi: exit code

exit:
  mov rax, SYS_EXIT
  syscall
  ret

;; Write to file descriptor.
;; 
;; Parameters:
;; - rdi: file descriptor
;; - rsi: data 
;; - rdx: data_size
;;
;; Returns: The number of bytes written on success. Negative error code on failure.

write:
  mov rax, SYS_WRITE
  syscall
  ret
