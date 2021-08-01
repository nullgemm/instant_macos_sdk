# Instant macOS SDK
This bash script downloads the macOS SDK and prepares it for cross-compilation under
ArchLinux (with the help of [osxcross](https://github.com/tpoechtrager/osxcross)).
It also eliminates the need for an Apple account without going warez by getting
all the necessary files directly from the official SoftwareUpdate servers.

Only the SDK is downloaded, not the entire Xcode environment (it is useless for
cross-compilation anyway, and would require downloading 7GB instead of 240MB).

## Usage
Make sure all the required dependencies are installed:
```
yay -S --needed - < arch_pkgs.list
```

And run the scripts:
```
./fetch.sh
./unpkg.sh
./build.sh
source ./sdk/update_env
```

## Running macOS ?
It is perfectly possible to use the `fetch.sh` script under macOS
if you wish to download the macOS SDK but without using an Apple account.
Run the fetching script (not the build script, it is only for Linux!):
```
./fetch.sh
```

Then simply double-click the downloaded packages to install them
 - sdk/CLTools_Executables.pkg
 - sdk/CLTools_macOSNMOS_SDK.pkg
 - sdk/CLTools_macOS_SDK.pkg
