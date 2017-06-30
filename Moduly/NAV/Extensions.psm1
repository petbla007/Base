# Create Demo Database

function New-ExtDemoNavInstance{
    param (
        [parameter(Mandatory=$true)]
        [string] $DatabaseName,

        [parameter(Mandatory=$false)]
        [string] $DatabaseServer = "ZLPETBLA2",
        
        [parameter(Mandatory=$false)]
        [string] $InstanceName = "MSSQL2014",

        [parameter(Mandatory=$true)]
        [int] $portMaska,

        [parameter(Mandatory=$false)]
        [string] $ServiceAccount = "SQLService"
    )
    BEGIN
    {
        Write-Verbose "Create NEW NAV Instance ..."
    }
    PROCESS
    {
        if (-not (Get-NAVServerInstance $InstanceName))
        {
            if([string]::IsNullOrEmpty($credential))
            {
                $credential = (Get-Credential -UserName $ServiceAccount -Message "Heslo účtu NAV Serveru")
            }
        
            $portMng = $portMaska + 5
            $portCli = $portMaska + 6
            $portSoa = $portMaska + 7
            $portOda = $portMaska + 8
            New-NAVServerInstance -DatabaseServer $DatabaseServer -DatabaseName $DatabaseName -ServerInstance $InstanceName `
                                    -ServiceAccount User -ServiceAccountCredential $credential `
                                    -ManagementServicesPort $portMng -ClientServicesPort $portCli `
                                    -SOAPServicesPort $portSoa -ODataServicesPort $portOda
            $portMaska = $portMaska + 10
        }
        Write-Verbose "Start NAV Instance..."
        Set-NAVServerInstance -ServerInstance $InstanceName -Start
    }
    END
    {
        Write-Verbose "Create NAV Instance finished."
    }
}

function New-ExtDemoDatabase{
    param (

        [parameter(Mandatory=$true)]
        [string] $DatabaseName,

        [parameter(Mandatory=$false)]
        [string] $DatabaseServer = "ZLPETBLA2",

        [parameter(Mandatory=$false)]
        [string] $DatabaseInstance = "MSSQL2014",

        [parameter(Mandatory=$true)]
        [string] $BackupDatabaseFile
    )
    BEGIN
    {
        Write-Verbose "Create NEW NAV database ..."
    }
    PROCESS
    {
        
        $SqlFilePath = "c:\mssql\" + $DatabaseName

        New-NAVDatabase $BackupDatabaseFile `
            -DatabaseServer $DatabaseServer `
            -DatabaseInstance $DatabaseInstance `
            -DatabaseName $DatabaseName `
            -DataFilesDestinationPath $SqlFilePath `
            -LogFilesDestinationPath $SqlFilePath
    }
    END
    {
        Write-Verbose "Create database NAV finished."
    }
}

