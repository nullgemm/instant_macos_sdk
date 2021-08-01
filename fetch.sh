#!/bin/bash

# sucatalog (app list)
# ( https://github.com/munki/macadmin-scripts/blob/main/installinstallmacos.py )
#url="https://swscan.apple.com/content/catalogs/others/index-11-10.15-10.14-10.13-10.12-10.11-10.10-10.9-mountainlion-lion-snowleopard-leopard.merged-1.sucatalog"

# customer seed (app id)
# ( search for `SDK.smd` in new sucatalog files )
#id="001-89745"

echo "# Downloading the SDK packages"

cd "$(dirname "$0")"
mkdir -p sdk
cd sdk

# L.egacy?
#curl -LO http://swcdn.apple.com/content/downloads/46/21/001-89745-A_56FM390IW5/v1um2qppgfdnam2e9cdqcqu2r6k8aa3lis/CLTools_macOSLMOS_SDK.pkg
# N.ew?
curl -LO http://swcdn.apple.com/content/downloads/46/21/001-89745-A_56FM390IW5/v1um2qppgfdnam2e9cdqcqu2r6k8aa3lis/CLTools_macOSNMOS_SDK.pkg
# Tools
curl -LO http://swcdn.apple.com/content/downloads/46/21/001-89745-A_56FM390IW5/v1um2qppgfdnam2e9cdqcqu2r6k8aa3lis/CLTools_Executables.pkg
# SDK
curl -LO http://swcdn.apple.com/content/downloads/46/21/001-89745-A_56FM390IW5/v1um2qppgfdnam2e9cdqcqu2r6k8aa3lis/CLTools_macOS_SDK.pkg
