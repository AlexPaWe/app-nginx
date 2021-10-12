OPEN_FILE_CACHE=caching
WORKER_CONNECTIONS=32
ACCESS_LOG=y
KEEPALIVE_TIMEOUT=10
PAYLOAD_SIZE=500

cat nginx-$OPEN_FILE_CACHE.conf | sed "s/\$WORKER_CONNECTIONS/${WORKER_CONNECTIONS}/g" > ./fs0/nginx/conf/nginx.conf
if [[ $ACCESS_LOG == "y" ]]; then \
  export ACCESS_LOG="\/dev\/stdout"; \
else \
  export ACCESS_LOG="off"; \
fi
sed -i "s/\$ACCESS_LOG/${ACCESS_LOG}/g" ./fs0/nginx/conf/nginx.conf
sed -i "s/\$KEEPALIVE_TIMEOUT/${KEEPALIVE_TIMEOUT}/g" ./fs0/nginx/conf/nginx.conf

# Generate cpio image
cd fs0/
tr -dc A-Za-z0-9 </dev/urandom | head -c ${PAYLOAD_SIZE} > ./nginx/html/payload.txt
find -depth -print | tac | bsdcpio -o -v --format newc > ../initramfs.cpio
