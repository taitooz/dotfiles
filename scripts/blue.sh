#!/bin/bash
killall btsco
zenity --info --text="Click ok to search for your headset. Please ensure that your headset is in 'discoverable' mode."
results=`hcitool scan`
results=${results:13}
declare -a macaddresses
declare -a names
i=1
temp2=""

while [ -n "$results" ]; do
  temp=$results
  macaddresses[$i]=${temp:0:18}
  results=${results:18}
  temp=${results%00:*}
  names[$i]=$temp
  results=${results:${#temp}}
  i=$i+1;
done

if [ 0 -lt ${#macaddresses[@]} ]; then
  address=`zenity --text="Please select your headset from the following list.\
  \nIf your headset does not appear here click cancel." --list --column Address --column Name  ${macaddresses[1]} "${names[1]}"  ${macaddresses[2]} "${names[2]}"  ${macaddresses[3]} "${names[3]}"  ${macaddresses[4]} "${names[4]}"  ${macaddresses[5]} "${names[5]}"  ${macaddresses[6]} "${names[6]}"  ${macaddresses[7]} "${names[7]}"  ${macaddresses[8]} "${names[8]}"  ${macaddresses[9]} "${names[9]}"  ${macaddresses[10]} "${names[10]}" `
  if [ -n "$address" ]; then
    btsco -f -r -s $address
    if [ -a /tmp/bt_headset_connected ]; then
      zenity --info --text="Connection Successful!"
    else
      zenity --warning --text="Something's not right here, check the README and try again."
    fi
  else
    zenity --warning --text="Please ensure you device is discoverable and restart this program to search again."
  fi  
else
  zenity --warning --text="No bluetooth devices detected. Please ensure you device is discoverable and restart this program."
fi
