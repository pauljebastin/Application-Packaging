# ############################################### #
# Application Detection using Application File    #
# No dependency on ConfigMgr client               #
# More relliable than uninstall reg key           #
# Fast and lightweight                            #
# Proper Intune detection exit codes              #
# ############################################### #

$Application = "C:\Program Files\ApplicationFolder\<ApplicationFile>.exe"
$MinVersion = [version]"<App_Version>"

if (Test-Path $Application) {

    $Version = [version](Get-Item $Application).VersionInfo.FileVersion

    if ($Version -ge $MinVersion) {
        Write-Output "Installed"
        exit 0
    }
}else{
    Write-Output "Not Installed"
    exit 1
}

