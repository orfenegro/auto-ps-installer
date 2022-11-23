<# 
ilk powershell scriptim 

Scriptimizi çalıştırabilmek için remote signed yapıyoruz:

Set-ExecutionPolicy -ExecutionPolicy RemoteSigned

Detaylı bilgi:

https://learn.microsoft.com/tr-tr/powershell/module/microsoft.powershell.core/about/about_execution_policies?view=powershell-7.3

#>

$directoryRead = Read-Host -Prompt "kurulacak programlarin oldugu klasoru girin"
$fileNames = Get-ChildItem $directory -Recurse -include *.txt,*.msi | ForEach-Object {$_.name}

<#
Try{
	Start-Transcript -Path "C:\automation\logs\notepad++_install.log" -Force -ErrorAction Stop
}catch{
	Start-Transcript -Path "C:\automation\logs\notepad++_install.log" -Force
}

$32bit_softwares = Get-ItemProperty HKLM:\SOFTWARE\wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* |
						Select-Object DisplayName,DisplayVersion,Publisher,InstallDate
						
$64bit_softwares = Get-ItemProperty HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\* |
						Select-Object DisplayName,DisplayVersion,Publisher,InstallDate		

$all_softwares = $32bit_softwares+$64bit_softwares	

$softwareName = "*shot*"

if ( $all_softwares.DisplayName -like "$softwareName*"){
    Write-Output "Software is already installed"
    Write-Host "--------> Exiting <--------" -ForegroundColor Red -BackgroundColor Yellow
    Exit;
} else {
    Write-Output "Software not installed. Proceeding with installation"

    $pathvargs = {C:\Users\faruk\Downloads\shotcut-win64-221025.exe /S /v/qn }
    Invoke-Command -ScriptBlock $pathvargs
    
}

#>

#Get-ChildItem c:\users\faruk | ForEach-Object {$_.name}
#Download the file at the specified location
<#

if (-not ( Test-Path $installation_file)){

    New-Item $destination_dir -ItemType Directory -Force
    Invoke-WebRequest -Uri $source -OutFile $installation_file -Verbose 
    
}

Write-Output "Installing software: $softwareName"
Start-Process $installation_file /S -NoNewWindow -Wait -PassThru

if ( ( Get-ItemProperty HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*).DisplayName -like "$softwareName*"){
    Write-Output "Software is installed successfully"
}
#>

<#

Silent installation:

1)
$pathvargs = {C:\Temp\UpgradeClientInstaller\setup.exe /S /v/qn }
Invoke-Command -ScriptBlock $pathvargs

veya

2)
Start-Process -Wait -FilePath "C:\Users\faruk\Downloads\OBS-Studio-28.1.2-Full-Installer-x64.exe" -ArgumentList '/S','/v','/qn' -passthru

#>