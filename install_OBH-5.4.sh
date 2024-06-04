
echo " Downloading Image OpenBH Kernel 5.4"
sleep 4
BOXNAME=$(head -n 1 /etc/hostname)
image="OpenBlackHole-5.4"
mrf="/media/usb" "/media/hdd"
for mr in "${mrf[@]}"; do
   if [ -d "$mr" ]; then
      echo "$mr"
   fi
done
if [ -z "$mr" ]; then
   echo ""
   break
fi
done
echo "" > /dev/null 2>&1
if [ -z "$mr" ]; then
   echo "Sorry, your external memory device is not found" 1>&2
   exit 1
else
   mkdir $mr/images
fi

wget -O $mr/images/openblackhole-5.4.zip "https://image.openbh.net/5.4/openblackhole-5.4.zip"
sleep 2
for dir in $mr/images; do
   echo "Extracting firmware image to $dir ..."
   unzip -o $dir/openblackhole-5.4.zip >/dev/null 2>&1
done
echo ""
echo "  Uploading Firmware Image to /OPDB/BootUpload/"
sleep 4
mkdir $mr/images
cp $mrf/image /OPDB/BootUpload/ "$mr/images/openblackhole-5.4.zip" 
done
clear

#### #### #### #### #### #### #### #### #### #### #### ####
#### #### #### #### #### #### #### #### #### #### #### ####
clear
echo " Downloading Image done"
sleep 2
echo "  Uploading Image done"