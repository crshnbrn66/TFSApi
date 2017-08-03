function New-TFSTestSuite
{
  param(
    [string]$tfsinstance,
    [string]$tfsproject,
    [int]$testPlanId,
    [int]$parentSuiteId,
    [string]$SuiteName,
    [ValidateSet('StaticTestSuite', 'DynamicTestSuite', 'RequirementTestSuite')][string]$SuiteType,
    [int[]]$requirementIds,
    [string]$apiversion = '1.0'
  )

  #POST https://{instance}/DefaultCollection/{project}/_apis/test/plans/{plan}/suites/{parent}?api-version={version}
  $uri = "http://$tfsinstance/tfs/DefaultCollection/$tfsproject/_apis/test/plans/$testplanId/suites/$parentSuiteId`?api-version=$apiVersion"
  $reqmntIds = @();Foreach($i in $requirementIds){$reqmntIds +=@{id=$i}}
  $body = @{
    'SuiteType' = $SuiteType
    'Name' = $SuiteName
    'requirementIds' = $reqmntIds 
  }
  $testSuites = invoke-restmethod $uri -UseDefaultCredentials -Method Post -Body $body -ContentType 'application/json'
  $testSuites
}