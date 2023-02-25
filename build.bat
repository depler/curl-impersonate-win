if %GITHUB_ACTIONS%=="" (
    set MINGW64=c:\msys64\mingw64
) else (
    set MINGW64=d:\a\_temp\msys64\mingw64
)
set GOROOT=%MINGW64%\lib\go
set PATH=%MINGW64%\bin;%PATH%
set ROOT=%~dp0

cd %ROOT%boringssl
rmdir /s /q lib
cmake.exe -G "Ninja" -S . -B lib -DCMAKE_BUILD_TYPE=Release -DCMAKE_C_COMPILER=gcc.exe
ninja.exe -C lib crypto ssl
move /y lib\crypto\libcrypto.a lib\libcrypto.a
move /y lib\ssl\libssl.a lib\libssl.a

set IPV6=1

set ZLIB=1
set ZLIB_PATH=zlib_stub

set ZSTD=1
set ZSTD_PATH=zstd_stub

set BROTLI=1
set BROTLI_PATH=brotli_stub
set BROTLI_LIBS=-lbrotlidec -lbrotlicommon

set NGHTTP2=1
set NGHTTP2_PATH=nghttp2_stub

set IDN2=1
set LIBIDN2_PATH=idn2_stub

set SSL=1
set OPENSSL_PATH=%ROOT%boringssl
set OPENSSL_LIBPATH=%ROOT%boringssl\lib
set OPENSSL_LIBS=-lssl -lcrypto

cd %ROOT%curl
mingw32-make -f Makefile.dist mingw32-clean
mingw32-make -f Makefile.dist mingw32 -j

mkdir bin
move /y lib\*.dll bin
move /y lib\*.a bin
move /y src\*.exe bin
bin\curl.exe -V

pause
