echo "RECEIVER";
echo "nc -lp 1234 > taitooz.tar.gz";
echo "############################";
echo "TRANSMITTER";
echo "nc -w 1 localhost 1234 < taitooz.tar.gz";
