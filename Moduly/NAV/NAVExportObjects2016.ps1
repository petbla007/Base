
# Param
$Build  = "45243"
$FilterString   = ""


# Mudeles Import
Set-ExecutionPolicy unrestricted
Import-Module 'C:\Program Files (x86)\Microsoft Dynamics NAV\90\RoleTailored Client\Microsoft.Dynamics.Nav.Model.Tools.psd1' -Force
import-module "C:\Program Files\Microsoft Dynamics NAV\90\Service\NavAdminTool.ps1" -Force

# Preparation 
$ServerInstance = "DynamicsNAV90"
$DatabaseName   = "Demo Database NAV (9-0-$Build)"
$DatabaseServer = ".\MSSQL2014" 
$NAVObjectFile  = "C:\temp\NAVApp\NAVObjects90-" + $Build + ".txt"


# Set-NAVServerConfiguration $ServerInstance -KeyName DatabaseName -KeyValue $DatabaseName
# Set-NAVServerInstance $ServerInstance -restart

# Export Objects
Export-NAVApplicationObject -DatabaseName $DatabaseName -DatabaseServer $DatabaseServer -Path "$NAVObjectFile" -Filter $FilterString

