![](https://ci.appveyor.com/api/projects/status/nqh91ie30wnvgciy?svg=true)

####What is it?

An [Appease](http://appease.io) task template that sets an [Azure PowerShell](https://github.com/Azure/azure-powershell) account.

####How do I install it?

```PowerShell
Add-AppeaseTask `
    -DevOpName YOUR-DEVOP-NAME `
    -TemplateId SetAzurePowerShellAccount
```

####What parameters are required?

#####UserName
description: a `string` representing an Azure AD organizational account username.

#####Password
description: a `string` representing the password for the Azure AD organizational account specified by the `UserName` parameter.

####What parameters are optional?

#####PreserveExisting
description: a `switch` representing whether or not existing accounts should be left intact. By default all existing accounts are removed.
