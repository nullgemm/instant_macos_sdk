# Instant Xcode
This simple bash script downloads the MacOS SDK and (with the help of
[osxcross](https://github.com/tpoechtrager/osxcross)), prepares it for
cross-compilation under ArchLinux.
It also eliminates the need for an Apple account without going warez by getting
all the required files directly from the official SoftwareUpdate servers.
This script only downloads the SDK, not the entire Xcode environment, but it is
useless for cross-compiling and would require downloading 7GB instead of 240MB.

## Usage
```
./xcode.sh
source ./apple.sh
```
