function New-TFSTestPlan
{
    param(
          [string]$tfsproject,
          [string]$tfsinstance,
          
          [string]$Name,
          [string]$description,
          [string]$area,
          [string]$iteration,
          [datetime]$startDate,
          [datetime]$endDate,
          [string]$apiVersion="1.0")
    
    $uri ="http://$tfsinstance/tfs/DefaultCollection/$tfsproject/_apis/test/plans?api-version=$apiVersion"
    $a2 = @{"Name"= $area}
    $body = @{
        "name" = $Name
        "description"= $description
        "area" = $a2
        "iteration"= $iteration
        "startDate"= $startDate.ToUniversalTime().ToString("yyyy-MM-ddTHH:mm:ss.fffffffZ")
        "endDate"= $endDate.ToUniversalTime().ToString("yyyy-MM-ddTHH:mm:ss.fffffffZ")
    } | ConvertTo-Json
    $testplan = Invoke-RestMethod -Uri $uri -UseDefaultCredentials -Method post  -ContentType 'application/json' -body $body
    $testplan
}