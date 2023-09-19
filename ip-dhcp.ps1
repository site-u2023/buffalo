#!/usr/bin/env pwsh

$IPType = "IPv4"
$adapter = Get-NetAdapter -Physical | Where-Object {$_.PhysicalMediaType -like "*802.3*"} | ? {$_.Status -eq "Up"}
$interface = $adapter | Get-NetIPInterface -AddressFamily $IPType
If ($interface.Dhcp -eq "Disabled") {
If (($interface | Get-NetIPConfiguration).Ipv4DefaultGateway) {
$interface | Remove-NetRoute -Confirm:$false
}
$interface | Set-NetIPInterface -DHCP Enabled
$interface | Set-DnsClientServerAddress -ResetServerAddresses
}
$adapter | Restart-NetAdapter
