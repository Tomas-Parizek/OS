a:
	make -C bootloader
	make -C kernel
	cp bootloader/boot os
	cat kernel/kernel >> os
	rm kernel/kernel
	rm bootloader/boot
