set busybox64=%~dp0_tools\busybox64.exe
set patch=%busybox64% patch

cd %~dp0curl
%patch% -p1 < %~dp0_patch\curl-impersonate.patch

pause