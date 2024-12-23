#!/usr/bin/pwsh

New-Item C:\openwrt\ip -ItemType Directory -Force 
New-Item C:\openwrt\tftpdroot -ItemType Directory -Force 
New-Item C:\openwrt\buffalo\ -ItemType Directory -Force
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/site-u2023/buffalo/main/192-168-1-2.ps1" -OutFile "C:\openwrt\ip\192-168-1-2.ps1"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/site-u2023/buffalo/main/192-168-11-10.ps1" -OutFile "C:\openwrt\ip\192-168-11-10.ps1"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/site-u2023/buffalo/main/dhcp.ps1" -OutFile "C:\openwrt\ip\dhcp.ps1"
Invoke-WebRequest -Uri "https://downloads.openwrt.org/releases/21.02.7/targets/ipq40xx/generic/openwrt-21.02.7-ipq40xx-generic-buffalo_wtr-m2133hp-initramfs-fit-uImage.itb" -OutFile "C:\openwrt\tftpdroot\WTR-M2133HP-initramfs.uImage"
Invoke-WebRequest -Uri "https://downloads.openwrt.org/releases/21.02.7/targets/ipq40xx/generic/openwrt-21.02.7-ipq40xx-generic-buffalo_wtr-m2133hp-squashfs-nand-factory.ubi" -OutFile "C:\openwrt\buffalo\openwrt-21.02.7-ipq40xx-generic-buffalo_wtr-m2133hp-squashfs-nand-factory.ubi"
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
