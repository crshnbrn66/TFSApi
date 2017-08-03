function Get-TFSTestCases
{
  param
  (
    [string]$tfsinstance,
    [string]$tfsproject,
    [int]$testPlanId,
    [int]$suiteID,
    [string]$apiversion = '1.0'
    )
    #GET https://{instance}/DefaultCollection/{project}/_apis/test/plans/{plan}/suites/{suite}/testcases/{case}?api-version={version}
    $uri = "http://$tfsinstance/tfs/DefaultCollection/$tfsproject/_apis/test/plans/$testplanId/suites/$suiteID/testcases?api-version=$apiVersion"
    $ActiveTestPlans = invoke-restmethod $uri -UseDefaultCredentials -Method Get
    $ActiveTestPlans
}