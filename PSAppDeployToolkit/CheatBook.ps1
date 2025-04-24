# Add Certificate to TrustedPublisher Folder
Import-Certificate -FilePath "$($adtSession.DirSupportFiles)\Certificate.cer" -CertStoreLocation 'Cert:\LocalMachine\TrustedPublisher'

# Install All Driver Files using PNPUtil.exe Utility
Get-ChildItem $($adtSession.DirFiles) -Recurse -Filter "*inf" | ForEach-Object { PNPUtil.exe /add-driver $_.FullName /install }

# Get last update/write time
Get-ChildItem "$env:ProgramData\Files\file.txt" | where{$_.LastWriteTime -ge [datetime]::parseexact($appScriptDate, 'dd/MM/yyyy', $null)}

# Get Full Name of the folder including its path
Get-ChildItem -Path $env:ProgramData | Where {$_.Name -match 'FoldeName'} |select -exp fullname
