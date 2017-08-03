function Get-TFSClassificationNodes
{
  param
  (
    [string]$tfsinstance,
    [string]$tfsproject,
    [string]$apiversion = '1.0',
    [int]$depth = '100',
    [ValidateSet('areas', 'iterations')][string]$nodeType  
  )
  #https://www.visualstudio.com/en-us/docs/integrate/api/wit/classification-nodes
  #GET https://{instance}/DefaultCollection/{project}/_apis/wit/classificationnodes/{nodeType}/{nodePath}?api-version={version}[&$depth={int}]
  $classifications = Invoke-RestMethod "http://$tfsinstance/tfs/defaultcollection/$tfsproject/_apis/wit/classificationnodes/$nodeType`?`$depth=$depth&api-version=$apiversion" -UseDefaultCredentials
  $classifications
}