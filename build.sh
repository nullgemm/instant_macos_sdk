#!/bin/bash

cd "$(dirname "$0")"/sdk

echo "# Downloading an osxcross source snapshot"

curl -LO https://github.com/tpoechtrager/osxcross/archive/master.zip
unzip master.zip
mv osxcross-master osxcross

echo "# Preparing the SDK with osxcross"

XCODEDIR=root osxcross/tools/gen_sdk_package.sh
mv MacOSX13.sdk.tar.xz osxcross/tarballs

echo "# Installing the SDK"

UNATTENDED=1 osxcross/build.sh

echo "# Generating an environment script"

osxcross=$(cd osxcross/target && pwd)
echo "export PATH=\$PATH:$osxcross/bin/" >> ./update_env
echo "export LD_LIBRARY_PATH=\$LD_LIBRARY_PATH:$osxcross/lib/" >> ./update_env

echo "# Done"
echo "add $osxcross/bin/ to your PATH variable"
echo "and $osxcross/lib/ to your LD_LIBRARY_PATH variable"
echo "alternatively, you can \`source update_env.sh\` when needed"
