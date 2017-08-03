function Get-ActiveTFSTestPlans
{ 
    param($tfsInstance, $tfsproject,$apiVersion)
    $uri = "http://$tfsinstance/tfs/DefaultCollection/$tfsproject/_apis/test/plans?filterActivePlans=true&api-version=$apiVersion"
    $ActiveTestPlans = invoke-restmethod $uri -UseDefaultCredentials -Method Get
    $ActiveTestPlans
}

