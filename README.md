
# Yigit Basic Kernel

Kernel geliştirmede yaptığım ilk örnek olarak ekrana çıktı alan basit bir deneyim reposudur.
## Bağımlılıklar

### macOS
```bash
brew install i686-elf-gcc i686-elf-grub xorriso qemu
```

### Linux (Ubuntu/Debian)
```bash
sudo apt install gcc-multilib nasm grub-pc-bin grub-common xorriso qemu-system-x86
```

## Derleme

```bash
make        # kernel'i derle
make iso    # ISO oluştur
make qemu   # QEMU'da çalıştır
make clean  # temizle
```