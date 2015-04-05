# halt immediately on any errors which occur in this module
$ErrorActionPreference = 'Stop'

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
        Get-AzureAccount | %{Remove-AzureAccount $_.Id -Force}
    }

    $PSCredential = New-Object System.Management.Automation.PSCredential $UserName,($Password| ConvertTo-SecureString -AsPlainText -Force)
    Add-AzureAccount -Credential $PSCredential

}

Export-ModuleMember -Function Invoke
