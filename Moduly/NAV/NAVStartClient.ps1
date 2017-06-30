# Mudeles Import
Set-ExecutionPolicy unrestricted -Force
Import-Module 'C:\Program Files (x86)\Microsoft Dynamics NAV\80\RoleTailored Client\Microsoft.Dynamics.Nav.Model.Tools.psd1'
Import-Module 'C:\Program Files\Microsoft Dynamics NAV\80\Service\NavAdminTool.ps1'
Import-Module 'C:\Projekty\Tools\PowerShell\Scripts\NavCommonFunction.ps1'


# Parameters
$ServerName = "zlpetbla" 
$ServerInstance = "DynamicsNAV80_DEMO"
$ServerPort = 7046


# Start RTC Client
Start-NAVWindowsClient -ServerName $ServerName -ServerInstance $ServerInstance -Port $ServerPort

