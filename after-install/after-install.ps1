Write-Output "Listing Out the Local Profiles"
# getting local profiles
$profiles = get-wmiobject win32_userprofile -Filter "special='False'" | select LocalPath, SID
Write-Output $profiles
#Get-ItemProperty -Path $path | Select-Object -Property PSChildName, ProfileImagePath

Write-Output "Listing Out Local Users"
# get local users starting with a specific sid
$accounts = Get-LocalUser -Name "temp"
$accountName = $accounts.Name
Write-Output $accounts.Name

# removing profiles
Get-WMIObject -class Win32_UserProfile | Where -Property Name -EQ $accountName  | Remove-WmiObject

Remove-LocalUser -Name $accountName
