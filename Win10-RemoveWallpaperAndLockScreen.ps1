$RegKeyPath = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\PersonalizationCSP'
Remove-Item -Path $RegKeyPath -Force
# Clears the error log from powershell before exiting
    $error.clear()