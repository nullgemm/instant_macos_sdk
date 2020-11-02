#!/bin/bash

echo "downloading SDK"

# this folder will be used by `bake_macos_sdk.sh`
mkdir tmp

# using curl to make sure this script works under MacOS
curl -o tmp/fetch-macos.py https://raw.githubusercontent.com/foxlet/macOS-Simple-KVM/master/tools/FetchMacOS/fetch-macos.py

# patch the downloading script
sed -i -E "s/, keyword=\"BaseSystem\"//g" tmp/fetch-macos.py

# id found by downloading the CustomerSeed software update catalog from the URL found in fetch-macos.py
# (https://swscan.apple.com/content/catalogs/others/index-10.15customerseed-10.15-10.14-10.13-10.12-10.11-10.10-10.9-mountainlion-lion-snowleopard-leopard.merged-1.sucatalog).
# 061-26566 refers to "CLTools_macOS1015_SDK.smd"; it should be easy to find updates by searching for "SDK.smd".
python3 tmp/fetch-macos.py -o tmp -c CustomerSeed -p 061-26566
