# curl-impersonate-win

A special build of curl that can impersonate Chrome (Windows only).

Original idea and patches from https://github.com/lwthiker/curl-impersonate

# Environment
MSYS2 is needed to build binaries. Steps:
1. Download and install MSYS2 (https://www.msys2.org/)
2. Run MSYS2 from start menu and update packages with command: `pacman -Suy`
3. Install additional packages: `pacman -S mingw-w64-x86_64-make mingw-w64-x86_64-cmake mingw-w64-x86_64-nasm mingw-w64-x86_64-gcc`

# Build
