#!/bin/sh
#if [ $1=="-help" ]
#then
#echo "###############################"
#echo 
#echo "nohup restartx.sh -> by taitox."
#echo 
#echo "###############################"
#else 
sudo kill `cat /tmp/.X0-lock`
startx
#fi

