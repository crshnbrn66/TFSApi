function Get-TFSTestSuites
{
  param
  (
    [string]$tfsinstance,
    [string]$tfsproject,
    [int]$testPlanId,
    [int]$top,
    [int]$skip,
    [string]$apiversion = '1.0'
    )
    #https://www.visualstudio.com/en-us/docs/integrate/api/test/suites
    #GET https://{instance}/DefaultCollection/{project}/_apis/test/plans/{plan}/suites?api-version={version}[&$skip={int}&$top={int}&$asTreeView={bool}]
    $uri = "http://$tfsinstance/tfs/DefaultCollection/$tfsproject/_apis/test/plans/$testplanId/suites?api-version=$apiVersion"
    $testSuites = (invoke-restmethod $uri -UseDefaultCredentials -Method Get).value
    $testSuites
}