
# magiskboot
'magiskboot' command line application on linux

## Usage

### Unpack boot image

```sh
./magiskboot --unpack boot.img
```

### Extract ramdisk.img

```sh
mkdir ramdisk; cd ramdisk
cat ../ramdisk.cpio | cpio -i
```

### Create ramdisk.img

```sh
find . ! -name . | LC_ALL=C sort | cpio -o -H newc -R root:root > ../ramdisk.cpio
cd ..
```

### Repack boot image

```sh
./magiskboot --repack boot.img
```

