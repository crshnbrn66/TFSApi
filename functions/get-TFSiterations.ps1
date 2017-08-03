function Get-TFSIterations
{
  param([string]$tfsinstance,
        [string]$tfsproject,
        [string]$tfsteam,
        [string]$apiversion = 'v2.0-preview')
  
    $uri ="http://$tfsinstance/tfs/DefaultCollection/$tfsproject/_apis/work/teamsettings/iterations?api-version=$apiVersion"
    #'GET https://fabrikam-fiber-inc.visualstudio.com/DefaultCollection/Fabrikam-Fiber/_apis/work/teamsettings/iterations?api-version=v2.0-preview'
    $iterations = Invoke-RestMethod -Uri $uri -UseDefaultCredentials -Method get  #-ContentType 'application/json' 
    $iterations
}