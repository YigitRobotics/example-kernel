; GRUB Multiboot header + kernel entry point

MBALIGN  equ 1 << 0
MEMINFO  equ 1 << 1
MAGIC    equ 0x1BADB002
FLAGS    equ MBALIGN | MEMINFO
CHECKSUM equ -(MAGIC + FLAGS)

section .multiboot
align 4
    dd MAGIC
    dd FLAGS
    dd CHECKSUM

section .bss
align 16
stack_bottom:
    resb 16384      ; 16 KB stack
stack_top:

section .text
global _start
extern kernel_main

_start:
    mov esp, stack_top   ; stack'i kur
    call kernel_main     ; kernel.c'deki kernel_main'i çağrır
    cli                  ; interrupt'ları kapat
.hang:
    hlt                  ; dur (halt)
    jmp .hang