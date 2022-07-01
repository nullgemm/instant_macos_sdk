#!/bin/bash

# sucatalog (app list)
# https://github.com/munki/macadmin-scripts/blob/main/installinstallmacos.py
#url="https://swscan.apple.com/content/catalogs/others/index-12-10.16-10.15-10.14-10.13-10.12-10.11-10.10-10.9-mountainlion-lion-snowleopard-leopard.merged-1.sucatalog"

# customer seed (app id)
# search for `SDK.smd` in new sucatalog files and pick the most recent <dict>
# (there is a <date> section among their last elements)
#id="002-83793"

echo "# Downloading the SDK packages"

cd "$(dirname "$0")"
mkdir -p sdk
cd sdk

# L.egacy?
#curl -LO https://swcdn.apple.com/content/downloads/24/42/002-83793-A_74JRE8GVAT/rlnkct919wgc5c0pjq986z5bb9h62uvni2/CLTools_macOSLMOS_SDK.pkg
# N.ew?
curl -LO https://swcdn.apple.com/content/downloads/24/42/002-83793-A_74JRE8GVAT/rlnkct919wgc5c0pjq986z5bb9h62uvni2/CLTools_macOSNMOS_SDK.pkg
# Tools
curl -LO https://swcdn.apple.com/content/downloads/24/42/002-83793-A_74JRE8GVAT/rlnkct919wgc5c0pjq986z5bb9h62uvni2/CLTools_Executables.pkg
# SDK
curl -LO https://swcdn.apple.com/content/downloads/24/42/002-83793-A_74JRE8GVAT/rlnkct919wgc5c0pjq986z5bb9h62uvni2/CLTools_macOS_SDK.pkg
