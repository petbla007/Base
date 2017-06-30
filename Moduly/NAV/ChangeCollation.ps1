# Run as administrator

Set-ExecutionPolicy unrestricted -Force
Import-Module 'C:\Program Files\Microsoft Dynamics NAV\80\Service\NavAdminTool.ps1'


# Create NEW instance

Export-NAVData -DatabaseName BP2015 -FilePath c:\temp\BP2015 -CompanyName Test-školení -DatabaseServer NBPETBLA\SQL2012 -IncludeGlobalData -IncludeApplication


New-NAVDatabase -DatabaseName BP2015CZ -FilePath C:\temp\backup\BP2015CZ.bak -DatabaseServer NBPETBLA\SQL2012 -DestinationPath C:\MSSQL
Import-NAVData -DatabaseName BP2015CZ -FilePath c:\temp\BP2015.navdata -CompanyName Test-školení -DatabaseServer NBPETBLA\SQL2012 -IncludeApplicationData -IncludeGlobalData


# Testovací část 



