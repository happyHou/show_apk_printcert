#!/usr/bin/env bash

apk_name=$1;
temp_name="temp_folder"
base_path="$(PWD)"

temp_path="$base_path/$temp_name";
apk_path="$base_path/$apk_name";
temp_folder_path="$base_path/$temp_name"

if [ "-$1" == - ]
then
	echo Usage apk_printcert xxx.apk
	exit
fi

if [ -f "$apk_path" ]
then
	echo "$apk_path found."
else
	echo "$apk_path not found."
	exit
fi

mkdir $temp_path;
cp -r $apk_path $temp_folder_path;
cd $temp_folder_path;
unzip -q $apk_name;
cd "$temp_folder_path/META-INF"
keytool -printcert -file CERT.RSA

rm -rf $temp_path;


