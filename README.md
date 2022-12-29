# curl-impersonate-win

A special build of curl for Windows that can impersonate Chrome and Safari.

Original idea and patches from https://github.com/lwthiker/curl-impersonate

# Version
Current version based on:
* Curl (https://github.com/curl/curl): v7.84.0
* BoringSSL (https://github.com/google/boringssl): 3a667d10e94186fd503966f5638e134fe9fb4080

# Environment
MSYS2 is needed to build binaries. Steps:
1. Download and install MSYS2 (https://www.msys2.org/) into folder `c:\msys64\`
2. Run MSYS2 from start menu and update packages with command: `pacman -Suy`
3. Install additional packages: `pacman -S patch mingw-w64-x86_64-make mingw-w64-x86_64-cmake mingw-w64-x86_64-nasm mingw-w64-x86_64-gcc mingw-w64-x86_64-go`

# Build
1. Clone this repository with --recursive attribute to get BoringSSL and Curl submodules.
2. Run script `copy_and_patch.bat` to copy original source codes to patchable directories and patch source code.
3. Run script `build.bat` to build binaries. Ready to use binaries are located within `curl\bin` folder.

In case if everything goes fine you should see this:

![image](https://user-images.githubusercontent.com/13541699/188266250-4d719755-2f9b-43c7-96e0-32bb54fbd132.png)

# Run
Executables and scripts are located inside release archive. Scripts can impersonate different browser, for example:

`curl_chrome104 --url https://www.google.com/search?q=cat --output google.html`

`curl_safari15_5 --url https://www.apple.com --output apple.html`
