echo "scp -l 8192 -c arcfour -i ss-flightsKey despegar@selfservice-adv-03:live.tar.gz ."
echo "-l limit 1MB 8192kb=mb avoid stalled"
echo "-c arcfour fastEncryption"
