#!/bin/bash
megauser=user@example.com
megapasswd=megasecure
remote_romdir="/Root/Romname"


devices=("d850" "d851" "d852" "d855" "f400" "ls990" "vs985")

. build/envsetup.sh
for device in ${devices[@]}; do
        echo "Building $device...."
        device_upperscale=`echo $device | tr '/a-z/' '/A-Z/'`
        brunch $device
        path_out=$remote_romdir
        path_out+="/"
        path_out+=$device_upperscale
        echo "uploading build to $path_out"
        path_in="out/target/product/"
        path_in+=$device
        path_in+="/lineage-*.zip"
        megaput -u $megauser -p $megapasswd $path_in --path="$path_out"
done
