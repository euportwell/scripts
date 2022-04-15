$RegKeyPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\PersonalizationCSP"
$LockScreenPath = "LockScreenImagePath"
$LockScreenStatus = "LockScreenImageStatus"
$LockScreenUrl = "LockScreenImageUrl"
$StatusValue = "1"
$url = "https://raw.githubusercontent.com/euportwell/wallpapers/main/EUCO_Wallpaper.jpg"

$LockScreenImageValue = "C:\MDM\wallpaper.jpg"
$directory = "C:\MDM\"
If ((Test-Path -Path $directory) -eq $false)
{
New-Item -Path $directory -ItemType directory
}

$wc = New-Object System.Net.WebClient
$wc.DownloadFile($url, $LockScreenImageValue)
if (!(Test-Path $RegKeyPath))
{
Write-Host "Creating registry path $($RegKeyPath)."
New-Item -Path $RegKeyPath -Force | Out-Null
}
New-ItemProperty -Path $RegKeyPath -Name $LockScreenStatus -Value $Statusvalue -PropertyType DWORD -Force | Out-Null
New-ItemProperty -Path $RegKeyPath -Name $LockScreenPath -Value $LockScreenImageValue -PropertyType STRING -Force | Out-Null
New-ItemProperty -Path $RegKeyPath -Name $LockScreenUrl -Value $LockScreenImageValue -PropertyType STRING -Force | Out-Null
