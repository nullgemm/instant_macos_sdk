#!/bin/bash

echo "# extracting SDK"
pbzx tmp/CLTools_macOS1015_SDK.pkg | cpio -i -D tmp
pbzx tmp/CLTools_Executables.pkg | cpio -i -D tmp

echo "# getting osxcross source snapshot"
wget -O tmp/master.zip https://github.com/tpoechtrager/osxcross/archive/master.zip
unzip tmp/master.zip
mv osxcross-master osxcross

echo "# preparing SDK with osxcross"
mkdir -p tmp/Contents/Developer/Platforms/MacOSX.platform/Developer
mv tmp/Library/Developer/CommandLineTools/SDKs\
	tmp/Contents/Developer/Platforms/MacOSX.platform/Developer
cp -r tmp/Library/Developer/CommandLineTools/usr\
	tmp/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX*.*.sdk
XCODEDIR=tmp ./osxcross/tools/gen_sdk_package.sh
mv MacOSX*.*.sdk.tar.xz osxcross/tarballs

echo "# installing SDK"
UNATTENDED=1 ./osxcross/build.sh

echo "# generating environment script"
osxcross=$(cd osxcross/target && pwd)
echo "#!/bin/bash" > ./update_env.sh
echo "export PATH=\$PATH:$osxcross/bin/" >> ./update_env.sh
echo "export LD_LIBRARY_PATH=\$LD_LIBRARY_PATH:$osxcross/lib/" >> ./update_env.sh
chmod +x ./update_env.sh

echo "# done"
echo "add $osxcross/bin/ to your PATH variable"
echo "and $osxcross/lib/ to your LD_LIBRARY_PATH variable"
echo "alternatively, you can \`source update_env.sh\` when needed"
