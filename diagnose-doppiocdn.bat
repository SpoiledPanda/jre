@echo off
setlocal

echo === Checking hosts file for doppiocdn/local overrides ===
findstr /I "doppiocdn img.doppiocdn.net 127.0.0.1 0.0.0.0 ::1" C:\Windows\System32\drivers\etc\hosts
if errorlevel 1 (
    echo No matching hosts entries found.
)

echo.
echo === DNS lookup for img.doppiocdn.net ===
nslookup img.doppiocdn.net

echo.
echo === Ping test for img.doppiocdn.net ===
ping img.doppiocdn.net

echo.
echo === WinHTTP proxy settings ===
netsh winhttp show proxy

echo.
echo === Done ===
echo If nslookup or ping shows 127.0.0.1, something is redirecting the domain locally.
echo Check hosts, VPN, ad blocker, antivirus web shield, or DNS filter.

endlocal
pause
