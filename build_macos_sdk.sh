#!/bin/bash

echo "# Extracting the SDK"

cd "$(dirname "$0")"/sdk
mkdir root

# L.egacy?
#pbzx CLTools_macOSLMOS_SDK.pkg | cpio -i -D root
# N.ew?
pbzx CLTools_macOSNMOS_SDK.pkg | cpio -i -D root
# Tools
pbzx CLTools_Executables.pkg | cpio -i -D root
# SDK
pbzx CLTools_macOS_SDK.pkg | cpio -i -D root

echo "# Downloading an osxcross source snapshot"

curl -LO https://github.com/tpoechtrager/osxcross/archive/master.zip
unzip master.zip
mv osxcross-master osxcross

echo "# Preparing the SDK with osxcross"

mkdir -p root/Contents/Developer/Platforms/MacOSX.platform/Developer
mv root/Library/Developer/CommandLineTools/SDKs\
	root/Contents/Developer/Platforms/MacOSX.platform/Developer
cp -r root/Library/Developer/CommandLineTools/usr\
	root/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX*.*.sdk
XCODEDIR=root osxcross/tools/gen_sdk_package.sh
mv MacOSX*.*.sdk.tar.xz osxcross/tarballs

echo "# Installing the SDK"

UNATTENDED=1 osxcross/build.sh

echo "# Generating an environment script"

osxcross=$(cd osxcross/target && pwd)
echo "#!/bin/bash" > ./update_env.sh
echo "export PATH=\$PATH:$osxcross/bin/" >> ./update_env.sh
echo "export LD_LIBRARY_PATH=\$LD_LIBRARY_PATH:$osxcross/lib/" >> ./update_env.sh
chmod +x ./update_env.sh

echo "# Done"
echo "add $osxcross/bin/ to your PATH variable"
echo "and $osxcross/lib/ to your LD_LIBRARY_PATH variable"
echo "alternatively, you can \`source update_env.sh\` when needed"
