xcopy .\boringssl_original\* .\boringssl\ /r /d /i /s /y /exclude:.\patch\excludecopy.txt
xcopy .\curl_original\* .\curl\ /r /d /i /s /y /exclude:.\patch\excludecopy.txt

start patch_boringssl.bat
start patch_curl.bat

pause