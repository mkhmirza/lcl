# ip address you wanna ping to see
$ip = @(
	"192.168.0.110" 
	"192.168.0.100"
	"192.168.0.105"
	"192.168.0.107"
	"192.168.0.108"
	"192.168.0.116"
	"192.168.0.131"
	"192.168.0.138"
)
$myarray = [System.Collections.ArrayList]::new()
$string = ""
$currentOutFileString =  ""
for($num=0; $num -lt $ip.Count; $num=$num+1) {
	Write-Output "Pinging: " $ip[$num]
	#ping -n 2 $ip[$num]
	# using test-connection applet which returns true or false depending
	# on the result of the ping 
	$returnCode = Test-Connection -ComputerName $ip[$num] -Quiet -Count 2
    if ($returnCode){
        $string = "$($ip[$num])|IN use`r`n"
        #Write-Output "IP Address is in use"
    } else {
        $string = "$($ip[$num])|NOT in use`r`n"
        #Write-Output "IP is not in use"
    }

    $currentOutFileString = $string
    $myarray.Add($currentOutFileString)
    Write-Output $currentOutFileString
    $myStringArray = [string]$myarray
    #Write-Output $ip[$num]
    if($num -eq $ip.Count - 1) {
        Out-File -FilePath .\ips.txt -InputObject $myStringArray -Encoding utf8
    }

}

