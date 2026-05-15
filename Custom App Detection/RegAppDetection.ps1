# #################################################
# Application Detection using Registery Key       #
# No dependency on ConfigMgr client               #
# Works on Intune-only devices                    #
# Fast and lightweight                            #
# Proper Intune detection exit codes              #
# #################################################

$AppName = '<App_Name>'
$MinVersion = [version]"App_Version"


$Paths = @(
    "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*",
    "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*"
)

$App = Get-ItemProperty $Paths -ErrorAction SilentlyContinue | Where-Object {$_.DisplayName -like "*$($AppName)*" } | Select-Object -First 1

if($App){
    try {
        $InstalledVersion = [version]$App.DisplayVersion

        if ($InstalledVersion -ge $MinVersion) {
            Write-Output "Installed"
            exit 0
        }
    }
    catch{
        #Write-Output "App Detection Error"
        exit 1
    }
}else{
    Write-Output "Not Installed"
    exit 1
}
