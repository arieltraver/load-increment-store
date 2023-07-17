@practice ref: https://helloworld.raspberrypi.org/articles/hw16-assembly-language-on-the-pi
.data
msg: .asciz "hello world\n"
len: . - msg

.text
.global _start

_start:
	ldr	r1, =msg	@as this is RISC, we load from mem, not just mov 
	ldr	r2, =len
	mov	r0, #1		@ standard output
	mov	r7, #4		@ ID for write
	swi	#0		@ syscall happens here, calls write
	mov	r7, #1		@ ID for exit
	swi	#0		@ call exit
