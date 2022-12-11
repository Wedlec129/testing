all:    printf    scanf
	@echo "Compile Sec!"
printf:    printf.o
	@ld -m elf_i386 printf.o -o printf

printf.o:
	@nasm -f elf32 printf.asm

scanf: scanf.o
	@ld -m elf_i386 scanf.o -o scanf

scanf.o:
	@nasm -f elf32 scanf.asm
