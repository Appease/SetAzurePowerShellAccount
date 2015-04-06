# halt immediately on any errors which occur in this module
$ErrorActionPreference = 'Stop'
Import-Module 'C:\Program Files (x86)\Microsoft SDKs\Azure\PowerShell\ServiceManagement\Azure' -Force -RequiredVersion '0.8.8'

function Invoke(

[string]
[ValidateNotNullOrEmpty()]
[Parameter(
    Mandatory=$true,
    ValueFromPipelineByPropertyName=$true)]
$UserName,

[string]
[ValidateNotNullOrEmpty()]
[Parameter(
    Mandatory=$true,
    ValueFromPipelineByPropertyName=$true)]
$Password,

[switch]
[Parameter(
    ValueFromPipelineByPropertyName=$true)]
$PreserveExisting){

    if(!$PreserveExisting.IsPresent){
        Azure\Get-AzureAccount | %{Azure\Remove-AzureAccount $_.Id -Force}
    }

    $PSCredential = New-Object System.Management.Automation.PSCredential $UserName,($Password| ConvertTo-SecureString -AsPlainText -Force)
    Azure\Add-AzureAccount -Credential $PSCredential

}

Export-ModuleMember -Function Invoke
