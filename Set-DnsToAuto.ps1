$MAC = "INPUT MAC HERE"

$InterfaceIndex = (Get-NetAdapter | Where-Object {$_.MacAddress -eq $MAC}).IfIndex 

If ($InterfaceIndex) {
    Set-DnsClientServerAddress -InterfaceIndex $InterfaceIndex -ResetServerAddresses
    #verify if it worked
    Write-Host "DNS server addresses for interface with MAC $MAC have been set to automatic."
} 
Else {
    Write-Host "No network adapter found with MAC address $MAC."
}