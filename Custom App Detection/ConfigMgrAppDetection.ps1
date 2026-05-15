# #################################################
# Application Detection using Config Manager WMi  #
# ConfigMgr client Dependent                      #
# Works only with ConfigMgr deployed apps         #
# Fast and lightweight                            #
# #################################################

$AppName = '<App_Name>'
$MinVersion = [version]"App_Version"

$AppInstall = Get-WmiObject -Namespace "root\cimv2\sms" -Class "SMS_InstalledSoftware" | Where-Object ProductName -Match "$($AppName)"

if($AppInstall){
    if([version]$AppInstall.ProductVersion -ge $MinVersion){
        Write-Host "Installed"
        exit 0
    }
}

Write-Host "Not Installed"
exit 1
