# Instant MacOS SDK
This bash script downloads the MacOS SDK and prepares it for cross-compilation under
ArchLinux (with the help of [osxcross](https://github.com/tpoechtrager/osxcross)).
It also eliminates the need for an Apple account without going warez by getting
all the necessary files directly from the official SoftwareUpdate servers.

Only the SDK is downloaded, not the entire Xcode environment (it is useless for
cross-compilation anyway, and would require downloading 7GB instead of 240MB).

## Usage
Make sure all the required dependencies are installed (ArchLinux example below)
```
yay -S --needed - < arch_pkgs.list
```

And run the scripts
```
./get_macos_sdk.sh
./bake_macos_sdk.sh
source ./update_env.sh
```

## Running MacOS ?
It is perfectly possible to use the `get_macos_sdk.sh` script under MacOS
if you wish to download the macOS SDK without using an Apple account.

You just have to install the required dependencies using [homebrew](https://brew.sh/)
```
brew install python
pip3 install requests
pip3 install click
```

Run the downloading script (not the baking script, it is only for Linux!)
```
./get_macos_sdk.sh
```

Then simply double-click the downloaded packages to install them
 - tmp/CLTools_macOS1015_SDK.pkg
 - tmp/CLTools_Executables.pkg
