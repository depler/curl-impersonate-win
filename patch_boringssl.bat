set patch=c:\msys64\usr\bin\patch.exe

cd %~dp0boringssl
%patch% -p1 < %~dp0patch\boringssl-old-ciphers.patch

pause