#!/bin/bash

echo "did you install the dependencies?"
echo "(\`yay -S --needed - < osxcross.list\`)"
read -p "[R] Run this command | [N] no | [Y] yes > " action

case $action in
	[rR]* ) yay -S --needed - < osxcross.list
		break;;
	[nN]* ) exit
		break;;
	[yY]* )
		break;;
esac

echo "getting osxcross source snapshot"
mkdir tmp
wget -O tmp/master.zip https://github.com/tpoechtrager/osxcross/archive/master.zip
unzip tmp/master.zip
mv osxcross-master osxcross

echo "downloading SDK"
wget -O tmp/fetch-macos.py https://raw.githubusercontent.com/foxlet/macOS-Simple-KVM/master/tools/FetchMacOS/fetch-macos.py
sed -i 's/, keyword="BaseSystem"//g' tmp/fetch-macos.py

# id found by downloading the CustomerSeed software update catalog from the URL found in fetch-macos.py
# (https://swscan.apple.com/content/catalogs/others/index-10.15customerseed-10.15-10.14-10.13-10.12-10.11-10.10-10.9-mountainlion-lion-snowleopard-leopard.merged-1.sucatalog).
# 061-26566 refers to "CLTools_macOS1015_SDK.smd"; it should be easy to find updates by searching for "SDK.smd".
python3 tmp/fetch-macos.py -o tmp -c CustomerSeed -p 061-26566

echo "extracting SDK"
pbzx tmp/CLTools_macOS1015_SDK.pkg | cpio -i -D tmp
pbzx tmp/CLTools_Executables.pkg | cpio -i -D tmp

echo "preparing SDK with osxcross"
mkdir -p tmp/Contents/Developer/Platforms/MacOSX.platform/Developer
mv tmp/Library/Developer/CommandLineTools/SDKs\
	tmp/Contents/Developer/Platforms/MacOSX.platform/Developer
cp -r tmp/Library/Developer/CommandLineTools/usr\
	tmp/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX*.*.sdk
XCODEDIR=tmp ./osxcross/tools/gen_sdk_package.sh
mv MacOSX*.*.sdk.tar.xz osxcross/tarballs

echo "installing SDK"
UNATTENDED=1 ./osxcross/build.sh

echo "generating environment script"
osxcross=$(cd osxcross/target && pwd)
echo "#!/bin/sh" > ./apple.sh
echo "export PATH=\$PATH:$osxcross/bin/" >> ./apple.sh
echo "export LD_LIBRARY_PATH=\$LD_LIBRARY_PATH:$osxcross/lib/" >> ./apple.sh
chmod +x ./apple.sh

echo "\ndone"
echo "add $osxcross/bin/ to your PATH variable"
echo "and $osxcross/lib/ to your LD_LIBRARY_PATH variable"
echo "alternatively, you can \`source apple.sh\` when needed"
