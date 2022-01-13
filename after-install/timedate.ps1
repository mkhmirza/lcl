# changing current time zone
$setTimeZone = "Pakistan Standard Time"
Set-TimeZone -Id $setTimeZone -Confirm

# adjusting time, date settings
Write-Output "Week Day, Month & Date  Information"
$weekDay = Read-Host -Prompt "Enter Current Week Day: "
$month = Read-Host -Prompt "Enter Current Month: "
$day = Read-Host -Prompt "Enter Current Date: "
$year = "2022"

Write-Output
Write-Output "Hour, Minute Information"
$hour = Read-Host -Prompt "Enter Hour of the day: "
$minute = Read-Host -Prompt "Enter Minutes: "
$seconds = "00"
$12hour = Read-Host "Enter AM or PM: "

$formatedDate = "$($weekDay), $($month) $($day), $($year) $($hour):$($minute):$($seconds) $($12hour)"
Write-Output $formatedDate
Set-Date -Date $formatedDate -Confirm 