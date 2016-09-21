[CmdletBinding()]
param(
    [string]$server,
    [string]$webSiteName,
    [string]$path,
    [boolean]$anonymousAuthentication,
    [boolean]$basicAuthentication,
    [boolean]$windowsAuthentication
)

Import-Module "Microsoft.TeamFoundation.DistributedTask.Task.Internal"
Import-Module "Microsoft.TeamFoundation.DistributedTask.Task.Common"

Write-Verbose "Entering script $($MyInvocation.MyCommand.Name)"
Write-Verbose "Parameter Values"
$PSBoundParameters.Keys | % { Write-Verbose "  ${_} = $($PSBoundParameters[$_])" }

$command = {  
    param(
        [string]$webSiteName,
        [string]$path,
        [boolean]$anonymousAuthentication,
        [boolean]$basicAuthentication,
        [boolean]$windowsAuthentication
    )
    Import-Module WebAdministration; 

    $location = "$webSiteName/$path"
    Write-Verbose "Setting authentication on $location"
    Set-WebConfigurationProperty -filter /system.webServer/security/authentication/anonymousAuthentication -name enabled -value $anonymousAuthentication  -location $location;  
    Set-WebConfigurationProperty -filter /system.webServer/security/authentication/basicAuthentication -name enabled -value $basicAuthentication -location $location;  
    Set-WebConfigurationProperty -filter /system.webServer/security/authentication/windowsAuthentication -name enabled -value $windowsAuthentication -location $location; 
    Write-Verbose "Authentication Set"
}

Invoke-Command -ComputerName $server $command -ArgumentList $webSiteName,$path,$anonymousAuthentication,$basicAuthentication,$windowsAuthentication