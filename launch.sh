#! /bin/bash

sudo qemu-system-x86_64 -cpu host -m 1G -nodefaults -display none -serial stdio -kernel build/nginx_kvm-x86_64 -initrd initramfs.cpio -append "-- -c /nginx/conf/nginx.conf" --enable-kvm -netdev user,id=n0,hostfwd=tcp::80-:80 -device virtio-net,netdev=n0 -s
