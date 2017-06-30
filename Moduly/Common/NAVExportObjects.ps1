# Mudeles Import
Import-Module 'C:\Program Files (x86)\Microsoft Dynamics NAV\80\RoleTailored Client\Microsoft.Dynamics.Nav.Model.Tools.psd1'

# Param
$ServerInstance = "DynamicsNAV80_DEMO"
$DatabaseName   = "Demo Database NAV (8-0-40938)"
$DatabaseServer = ".\MSSQL2014" 
$NAVObjectFile  = "NAVObjects80-40938.txt"
$FilterString   = ""

# Preparation 
$FilePath       = "C:\temp\NAVApp\"

Set-NAVServerConfiguration $ServerInstance -KeyName DatabaseName -KeyValue $DatabaseName
Set-NAVServerInstance $ServerInstance -restart

# Export Objects
Export-NAVApplicationObject -DatabaseName $DatabaseName -DatabaseServer $DatabaseServer -Path "$FilePath$NAVObjectFile" -Filter $FilterString


