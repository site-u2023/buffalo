#!/usr/bin/pwsh

New-Item C:\openwrt\ip -ItemType Directory -Force 
New-Item C:\openwrt\tftpdroot -ItemType Directory -Force 
New-Item C:\openwrt\buffalo\ -ItemType Directory -Force
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/site-u2023/buffalo/main/192-168-1-2.ps1" -OutFile "C:\openwrt\ip\192-168-1-2.ps1"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/site-u2023/buffalo/main/192-168-11-10.ps1" -OutFile "C:\openwrt\ip\192-168-11-10.ps1"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/site-u2023/buffalo/main/dhcp.ps1" -OutFile "C:\openwrt\ip\dhcp.ps1"
Invoke-WebRequest -Uri "https://github.com/ssyysy2021/openwrt_files/raw/main/openwrt-23.05.0-rc3_bin/buffalo_wsr-6000ax8/openwrt-23.05.0-rc3-mediatek-filogic-buffalo_wsr-6000ax8-initramfs-kernel.bin" -OutFile "C:\openwrt\tftpdroot\linux.ubi-recovery"
Invoke-WebRequest -Uri "https://github.com/ssyysy2021/openwrt_files/raw/main/openwrt-23.05.0-rc3_bin/buffalo_wsr-6000ax8/openwrt-23.05.0-rc3-mediatek-filogic-buffalo_wsr-6000ax8-squashfs-sysupgrade.bin" -OutFile "C:\openwrt\buffalo\openwrt-23.05.0-rc3-mediatek-filogic-buffalo_wsr-6000ax8-squashfs-sysupgrade.bin"
Invoke-WebRequest -Uri "https://www.vercot.com/~serva/download/Serva_Community_v4.6.0-21120715.zip" -OutFile "C:\openwrt\Serva.zip"
Expand-Archive -Path C:\openwrt\Serva.zip -DestinationPath C:\openwrt\Serva\ -Force
Remove-item C:\openwrt\Serva.zip
Invoke-WebRequest -Uri "https://github.com/site-u2023/buffalo/raw/main/Serva.ini" -OutFile "C:\openwrt\Serva\Serva.ini"
