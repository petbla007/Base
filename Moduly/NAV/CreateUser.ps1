# Mudeles Import
Set-ExecutionPolicy unrestricted -Force
Import-Module 'C:\Program Files (x86)\Microsoft Dynamics NAV\80\RoleTailored Client\Microsoft.Dynamics.Nav.Model.Tools.psd1'
Import-Module 'C:\Program Files\Microsoft Dynamics NAV\80\Service\NavAdminTool.ps1'
Import-Module 'C:\Projekty\Tools\PowerShell\Scripts\NavCommonFunction.ps1'


# Parameters
$ServerName = "zlpetbla" 
$ServerInstance = "DynamicsNAV80_DEMO"
$ServerPort = 7046
$UserName = "ZLPETBLA\Petr"


# Get SID of User
$objUser = New-Object System.Security.Principal.NTAccount("petr")
$strSID = $objUser.Translate([System.Security.Principal.SecurityIdentifier])
$Sid = $strSID.Value


# Create User
Get-NAVServerUser -ServerInstance $Serverinstance | Select-Object -Property UserName, LicenseType


# Start RTC Client
Start-NAVWindowsClient -ServerName $ServerName -ServerInstance $ServerInstance -Port $ServerPort


New-NAVServerUser -ServerInstance $Serverinstance -Sid $Sid
New-NAVServerUserPermissionSet -ServerInstance $Serverinstance -UserName $UserName -PermissionSetId "SUPER"



