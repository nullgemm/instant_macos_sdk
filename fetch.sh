#!/bin/bash

# sucatalog (app list)
# https://github.com/munki/macadmin-scripts/blob/main/installinstallmacos.py
#url="https://swscan.apple.com/content/catalogs/others/index-13-12-10.16-10.15-10.14-10.13-10.12-10.11-10.10-10.9-mountainlion-lion-snowleopard-leopard.merged-1.sucatalog.gz"

# customer seed (app id)
# search for `SDK.smd` in new sucatalog files and pick the most recent <dict>
# (there is a <date> section among their last elements)
#id="032-64167"

echo "# Downloading the SDK packages"

cd "$(dirname "$0")"
mkdir -p sdk
cd sdk

# L.egacy?
#curl -LO https://swcdn.apple.com/content/downloads/38/61/032-64167-A_F8LL7XSTW6/k3kg0uip4kxd3qupgy6y8fzp27mnxdpt6y/CLTools_macOSLMOS_SDK.pkg
# N.ew?
curl -LO https://swcdn.apple.com/content/downloads/38/61/032-64167-A_F8LL7XSTW6/k3kg0uip4kxd3qupgy6y8fzp27mnxdpt6y/CLTools_macOSNMOS_SDK.pkg
# Tools
curl -LO https://swcdn.apple.com/content/downloads/38/61/032-64167-A_F8LL7XSTW6/k3kg0uip4kxd3qupgy6y8fzp27mnxdpt6y/CLTools_Executables.pkg
# SDK
curl -LO https://swcdn.apple.com/content/downloads/38/61/032-64167-A_F8LL7XSTW6/k3kg0uip4kxd3qupgy6y8fzp27mnxdpt6y/CLTools_macOS_SDK.pkg
