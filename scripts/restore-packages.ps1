if (-not (Test-Path .\nuget.exe)) {
    Invoke-WebRequest -Uri "https://dist.nuget.org/win-x86-commandline/latest/nuget.exe" -OutFile .\nuget.exe
}

.\nuget.exe restore .\packages.config -PackagesDirectory .\packages
