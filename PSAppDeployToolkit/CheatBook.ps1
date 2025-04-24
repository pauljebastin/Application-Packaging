# Add Certificate to TrustedPublisher Folder
Import-Certificate -FilePath "$($adtSession.DirSupportFiles)\Certificate.cer" -CertStoreLocation 'Cert:\LocalMachine\TrustedPublisher'

# Install All Driver Files using PNPUtil.exe Utility
Get-ChildItem $($adtSession.DirFiles) -Recurse -Filter "*inf" | ForEach-Object { PNPUtil.exe /add-driver $_.FullName /install }
