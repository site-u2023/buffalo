#!/usr/bin/pwsh

$IP = "192.168.11.10"
$MaskBits = 24
$Gateway = "192.168.11.1"
$Dns = "192.168.11.1"
$IPType = "IPv4"
$adapter = Get-NetAdapter -Physical | Where-Object {$_.PhysicalMediaType -like "*802.3*"} | ? {$_.Status -eq "Up"}
If (($adapter | Get-NetIPConfiguration).IPv4Address.IPAddress) {
 $adapter | Remove-NetIPAddress -AddressFamily $IPType -Confirm:$false
}
If (($adapter | Get-NetIPConfiguration).Ipv4DefaultGateway) {
 $adapter | Remove-NetRoute -AddressFamily $IPType -Confirm:$false
}
$adapter | New-NetIPAddress `
 -AddressFamily $IPType `
 -IPAddress $IP `
 -PrefixLength $MaskBits `
 -DefaultGateway $Gateway
$adapter | Set-DnsClientServerAddress -ServerAddresses $DNS
$adapter | Restart-NetAdapter
