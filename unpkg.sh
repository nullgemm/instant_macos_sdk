#!/bin/bash

cd "$(dirname "$0")"/sdk

echo "# Extracting the SDK"

mkdir root
# L.egacy?
#pbzx CLTools_macOSLMOS_SDK.pkg | cpio -i -D root
# N.ew?
pbzx CLTools_macOSNMOS_SDK.pkg | cpio -i -D root
# Tools
pbzx CLTools_Executables.pkg | cpio -i -D root
# SDK
pbzx CLTools_macOS_SDK.pkg | cpio -i -D root

mkdir -p root/Contents/Developer/Platforms/MacOSX.platform/Developer
mv root/Library/Developer/CommandLineTools/SDKs\
	root/Contents/Developer/Platforms/MacOSX.platform/Developer
cp -r root/Library/Developer/CommandLineTools/usr\
	root/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX*.*.sdk
