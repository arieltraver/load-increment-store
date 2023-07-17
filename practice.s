/*practice ref: https://helloworld.raspberrypi.org/articles/hw16-assembly-language-on-the-pi*/
.data
msg: .asciz "hello world\n"
len = . - msg

.text
.global _start

_start:
	ldr	w1, =msg	/*as this is RISC, we load from mem, not just mov*/
	ldr	w2, =len
	mov	w0, #1		/* standard output*/
	mov	w7, #4		/* ID for write */
	swi	#0		/* syscall happens here, calls write*/
	mov	w7, #1		/* ID for exit*/
	swi	#0	/* call exit*/
