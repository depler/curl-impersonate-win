xcopy .\boringssl_original\* .\boringssl\ /r /d /i /s /y /exclude:.\patch\excludecopy.txt
xcopy .\curl_original\* .\curl\ /r /d /i /s /y /exclude:.\patch\excludecopy.txt

call patch_boringssl.bat
call patch_curl.bat

pause