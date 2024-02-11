set MINGW64=c:\msys64\mingw64
set GOROOT=%MINGW64%\lib\go
set PATH=%MINGW64%\bin;%PATH%
set ROOT=%~dp0

cd %ROOT%boringssl
rmdir /s /q lib
cmake.exe -G "Ninja" -S . -B lib -DCMAKE_BUILD_TYPE=Release -DCMAKE_C_COMPILER=gcc.exe
ninja.exe -C lib crypto ssl
move /y lib\crypto\libcrypto.a lib\libcrypto.a
move /y lib\ssl\libssl.a lib\libssl.a

set CFG=-ipv6 -zlib -zstd -brotli -nghttp2 -idn2 -ssl

set OPENSSL_PATH=%ROOT%boringssl
set OPENSSL_LIBPATH=%ROOT%boringssl\lib
set OPENSSL_LIBS=-lssl -lcrypto

cd %ROOT%curl
mingw32-make mingw32-clean -f Makefile.dist
mingw32-make mingw32 -f Makefile.dist -j

rmdir bin /s /q
mkdir bin

move /y lib\*.dll bin
move /y lib\*.a bin
move /y src\*.exe bin
bin\curl.exe -V

pause