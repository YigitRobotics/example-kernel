CC      = i686-elf-gcc
AS      = nasm
LD      = i686-elf-gcc

CFLAGS  = -std=gnu99 -ffreestanding -O2 -Wall -Wextra
LDFLAGS = -ffreestanding -O2 -nostdlib -T linker.ld

all: yigitkernel.bin

boot.o: boot.asm
	$(AS) -f elf32 boot.asm -o boot.o

kernel.o: kernel.c
	$(CC) $(CFLAGS) -c kernel.c -o kernel.o

yigitkernel.bin: boot.o kernel.o
	$(LD) $(LDFLAGS) -o yigitkernel.bin boot.o kernel.o -lgcc

iso: yigitkernel.bin
	mkdir -p isodir/boot/grub
	cp yigitkernel.bin isodir/boot/
	printf 'set timeout=0\nset default=0\nmenuentry "yigitkernel" {\n  multiboot /boot/yigitkernel.bin\n}\n' > isodir/boot/grub/grub.cfg
	i686-elf-grub-mkrescue -o yigitkernel.iso isodir

qemu: iso
	qemu-system-i386 -cdrom yigitkernel.iso

	
clean:
	rm -f *.o *.bin *.iso
	rm -rf isodir