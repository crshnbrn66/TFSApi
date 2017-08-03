function Get-TFSTestRuns
{
  param(
    [string]$tfsinstance,
    [string]$tfsproject,
    [string]$buildUri,
    [string]$owner,
    [int]$Planid,
    [boolean]$automated,
    [boolean]$includerunDetails,
    [int]$skip,
    [int]$top,
    [string]$apiversion = '1.0'
  )
  #to get all test runs all that is needed is the project name and api version 
  #awaiting detals from this submission to get to how to use the rest of the string to filter the result set. 
  #https://developercommunity.visualstudio.com/content/problem/89006/questions-about-the-tfsvsts-webapi-for-test-runs.html
  #GET https://{instance}/DefaultCollection/{project}/_apis/test/runs?api-version={version}[&buildUri={string}&owner={string}&planId={int}&automated={bool}&includerundetails={bool}&$skip={int}&$top={int}
  $uri = "http://$tfsinstance/tfs/DefaultCollection/$tfsproject/_apis/test/runs?api-version=$apiVersion"
  $testRuns = (invoke-restmethod $uri -UseDefaultCredentials -Method Get).value
  $testRuns
}