#!/usr/bin/pwsh

New-Item C:\openwrt\ip -ItemType Directory -Force 
New-Item C:\openwrt\tftpdroot -ItemType Directory -Force 
New-Item C:\openwrt\buffalo\ -ItemType Directory -Force
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/site-u2023/buffalo/main/192-168-1-2.ps1" -OutFile "C:\openwrt\ip\192-168-1-2.ps1"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/site-u2023/buffalo/main/192-168-11-10.ps1" -OutFile "C:\openwrt\ip\192-168-11-10.ps1"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/site-u2023/buffalo/main/dhcp.ps1" -OutFile "C:\openwrt\ip\dhcp.ps1"
Invoke-WebRequest -Uri "https://downloads.openwrt.org/releases/23.05.3/targets/ipq807x/generic/openwrt-23.05.3-ipq807x-generic-buffalo_wxr-5950ax12-initramfs-uImage.itb" -OutFile "C:\openwrt\tftpdroot\WXR-5950AX12-initramfs.uImage"
Invoke-WebRequest -Uri "https://downloads.openwrt.org/releases/23.05.3/targets/ipq807x/generic/openwrt-23.05.3-ipq807x-generic-buffalo_wxr-5950ax12-squashfs-sysupgrade.bin" -OutFile "C:\openwrt\buffalo\openwrt-ipq807x-generic-buffalo_wxr-5950ax12-squashfs-sysupgrade.bin"
Invoke-WebRequest -Uri "https://www.vercot.com/~serva/download/Serva_Community_v4.6.0-21120715.zip" -OutFile "C:\openwrt\Serva.zip"
Expand-Archive -Path C:\openwrt\Serva.zip -DestinationPath C:\openwrt\Serva\ -Force
Remove-item C:\openwrt\Serva.zip
Invoke-WebRequest -Uri "https://github.com/site-u2023/buffalo/raw/main/Serva.ini" -OutFile "C:\openwrt\Serva\Serva.ini"
