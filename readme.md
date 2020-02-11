# Instant Xcode
This simple bash script downloads the MacOS SDK and (with the help of
[osxcross](https://github.com/tpoechtrager/osxcross)), prepares it for
cross-compilation under ArchLinux.
It also eliminates the need for an Apple account without going warez by getting
all the files directly from the official SoftwareUpdate servers.

Only the SDK is downloaded, not the entire Xcode environment (it is useless for
cross-compilation anyway, and would require downloading 7GB instead of 240MB).

## Usage
```
./xcode.sh
source ./apple.sh
```
