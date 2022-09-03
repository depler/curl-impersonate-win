set patch=c:\msys64\usr\bin\patch.exe
set sed=c:\msys64\usr\bin\sed.exe

cd %~dp0boringssl
%patch% -p1 < %~dp0patch\boringssl-old-ciphers.patch
%sed% -i 's/-ggdb//g' CMakeLists.txt
%sed% -i 's/-Werror//g' CMakeLists.txt

pause