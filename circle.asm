;*****************************************************************************************************************************
; Program name: "Find_Circumference".  This program allow the user to input the radius of a circle and find out its          *
; circumfrence in both decimal and hexadecimal. Inputs with decimal values can be computed  Copyright (C) 2020 AJ Albrecht   *
; This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License  *
; version 3 as published by the Free Software Foundation.                                                                    *
; This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied         *
; Warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.     *
; A copy of the GNU General Public License v3 is available here:  <https://www.gnu.org/licenses/>.                           *
;*****************************************************************************************************************************
;=======1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**
;
;Author information
;Author name: AJ Albrecht
;Author email: ajalbrecht@fullerton.edu
;
;Program information
;  Program name: Least_to_Greatest
;  Programming languages: C, x86 Assembly and Bash
;  Date program began:     2020-Oct-29
;  Date program completed: 2020-Nov-7
;  Date comments upgraded: 2020-Nov-7
;  Files in this program: r.sh circumference.c circle.ams
;  Status: Complete. No bugs found after testing.
;
;References for this program
;  Albrecht, What_Is_The_Sum, version 1
;  Albrecht, Least_to_Greatest, version 1
;  Holiday, Floating Io, version 1.
;  Holiday, numbers4scientists, version 1
;
;Purpose
;  Compute the circumference of a circle while also providing its circumference in hexadecimal.
;
;This file
;   File name: circle.asm
;   Language: X86 with Intel syntax
;   Max page width: 132 columns
;   Assemble: nasm -f elf64 -l circle.lis -o circle.o circle.asm
;   Link: g++ -m64 -no-pie -o Find_Circumference.out -std=c17 circumfrence.o circle.o
;   Optimal print specification: 132 columns width, 7 points, monospace, 8½x11 paper
;
;Purpose of this file
;   Compute the circumference of the circle the user provides.

global circle

segment .data
stringoutputformat db "%s", 0 ; writes
signedintegerinputformat db "%ld", 0 ; inputs
floatform db "%lf", 0 ;allows for decimal outputs
myName db "This circle function is brought to you by AJ Albrecht.", 10, 0
ask db "Please enter the radius of a circle as a floating point number: ", 0
receive db "The number %1.10lf was received.", 10, 0
result db "The circumference of a circle with this radius is %1.10lf meters.", 10, 0
goodbye db "The circumference will be returned to the main program. Please enjoy your circles.", 10, 0

segment .bss
; There are no arrays in this program.

segment .text
circle:

; Declare the names of programs called from this X86 source file, but whose own source code is not in this file.
extern printf
extern scanf

; Back up the general purpose registers for the sole purpose of protecting the data of the caller.
push rbp                                                    ;Backup rbp
mov  rbp,rsp                                                ;The base pointer now points to top of stack
push rdi                                                    ;Backup rdi
push rsi                                                    ;Backup rsi
push rdx                                                    ;Backup rdx
push rcx                                                    ;Backup rcx
push r8                                                     ;Backup r8
push r9                                                     ;Backup r9
push r10                                                    ;Backup r10
push r11                                                    ;Backup r11
push r12                                                    ;Backup r12
push r13                                                    ;Backup r13
push r14                                                    ;Backup r14
push r15                                                    ;Backup r15
push rbx                                                    ;Backup rbx
pushf                                                       ;Backup rflags
push qword -1                                               ;Now the number of pushes is even

; Program register usage list
; xmm15 = user input and latter final response
; xmm14 = Pi constant to 20 decimal places
; xmm13 = 2 constant that is later used as a multiplayer
; r15 = used to keep on the boundary and pass in IEE754 numbers

; Write author name to the screen.
mov qword rdi, stringoutputformat
mov qword rsi, myName
mov qword rax, 0
call printf

; Ask the user for a floating point input.
mov qword rdi, stringoutputformat
mov qword rsi, ask
mov qword rax, 0
call printf

; Take in the users response to the previous question.
push qword 0
mov rax, 0
mov rdi, floatform
mov rsi, rsp
call scanf
movsd xmm15, [rsp]
pop r15

; Display user response input.
push qword 0
mov rax, 1
mov rdi, receive
movsd xmm0, xmm15
call printf
pop r15

; Calculate the circumference of the circle. (response*pi*2) -------------
; Move the IEEE754 value of pi to xmm14.
mov r15, 0x400921FB54442D18
push r15
movsd xmm14,[rsp]
pop r15

; Move the IEEE754 value of 2 to xmm13
mov r15, 0x4000000000000000
push r15
movsd xmm13, [rsp]
pop r15

; Multiply the response, pi and 2 together to compute the answer
mulsd xmm15, xmm14
mulsd xmm15, xmm13
; ------------------------------------------------------------------------

; Display the results to the user.
push qword 0
mov rax, 1
mov rdi, result
movsd xmm0, xmm15
call printf
pop r15

; Let the user know the circle file is about to finish running.
mov qword rdi, stringoutputformat
mov qword rsi, goodbye
mov qword rax, 0
call printf

; Store the answer into xmm0 so it can be returned to the driver.
movsd xmm0, xmm15

; Restore the original values to the general registers before returning to the caller.
pop r15                                                     ;Remove the extra -1 from the stack
popf                                                        ;Restore rflags
pop rbx                                                     ;Restore rbx
pop r15                                                     ;Restore r15
pop r14                                                     ;Restore r14
pop r13                                                     ;Restore r13
pop r12                                                     ;Restore r12
pop r11                                                     ;Restore r11
pop r10                                                     ;Restore r10
pop r9                                                      ;Restore r9
pop r8                                                      ;Restore r8
pop rcx                                                     ;Restore rcx
pop rdx                                                     ;Restore rdx
pop rsi                                                     ;Restore rsi
pop rdi                                                     ;Restore rdi
pop rbp                                                     ;Restore rbp

; Pass back the result of the circumference computation to the main file.
ret
