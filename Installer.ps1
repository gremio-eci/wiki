Set-ExecutionPolicy Bypass -Scope Process -Force;
$Packages = 'hugo', 'git'

If(Test-Path -Path "$env:ProgramData\Chocolatey"){

	ForEach ($PackageName in $Packages){
        	choco install $PackageName -y
	}
}

Else{
	$InstallDir='C:\ProgramData\chocoportable'
        $env:ChocolateyInstall="$InstallDir"
        Set-ExecutionPolicy Bypass -Scope Process -Force;
        iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

	ForEach ($PackageName in $Packages){
        	choco install $PackageName -y
	}
}