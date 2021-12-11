a:
	clang -c -ffreestanding -target x86_64-none-elf -Iinc/ kernel.c
	nasm -f elf64 entry.asm -o entry.o
	ld.lld -Ttext 0x7e00 --oformat binary entry.o kernel.o -o kernel
	rm *.o
