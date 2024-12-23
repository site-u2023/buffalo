#!/usr/bin/pwsh

& ".\Downloads\wxr5950ax12-305.exe"
New-Item C:\openwrt\ip -ItemType Directory -Force
New-Item C:\openwrt\tftpdroot -ItemType Directory -Force
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/site-u2023/buffalo/main/192-168-1-2.ps1" -OutFile "C:\openwrt\ip\192-168-1-2.ps1"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/site-u2023/buffalo/main/192-168-11-10.ps1" -OutFile "C:\openwrt\ip\192-168-11-10.ps1"
Invoke-WebRequest -Uri https://raw.githubusercontent.com/site-u2023/buffalo/main/dhcp.ps1 -OutFile "C:\openwrt\ip\dhcp.ps1"
Invoke-WebRequest -Uri "https://downloads.openwrt.org/releases/23.05.0/targets/ipq807x/generic/openwrt-23.05.0-ipq807x-generic-buffalo_wxr-5950ax12-initramfs-uImage.itb" -OutFile "C:\openwrt\tftpdroot\WXR-5950AX12-initramfs.uImage"
$LINKS = Invoke-WebRequest "https://www.vercot.com/~serva/download.html" -UseBasicParsing
$LINKS_VERSION = $LINKS.Links | Where-Object {$_.href -like "*Serva_Community_*.zip*"} | Select-Object -ExpandProperty href
$VERSION = ($LINKS_VERSION -split '/')[-1]
Write-Host Version to install $VERSION
Invoke-WebRequest -Uri "https://www.vercot.com/~serva/download/$VERSION" -OutFile "C:\openwrt\Serva.zip"
while ($true){
    if (Test-Path -Path "C:\openwrt\Serva.zip"){
        break
    }
    Write-Host "File not found. Waiting..."
    Start-Sleep -Seconds 3
}

Expand-Archive -Path C:\openwrt\Serva.zip -DestinationPath C:\openwrt\Serva\ -Force
Remove-item C:\openwrt\Serva.zip
Invoke-WebRequest -Uri "https://github.com/site-u2023/buffalo/raw/main/Serva.ini" -OutFile "C:\openwrt\Serva\Serva.ini"
Invoke-WebRequest -Uri "https://github.com/musashino205/firmware-wintools/releases/download/0.6.5.2/firmware-wintools_0.6.5.2.zip" -OutFile "C:\openwrt\firmware-wintools.zip"
Expand-Archive -Path C:\openwrt\firmware-wintools.zip -DestinationPath C:\openwrt\ -Force
Remove-item C:\openwrt\firmware-wintools.zip
