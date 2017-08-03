function Get-TFSTestPlanId
{
    param
    (
    [string]$tfsinstance,
    [string]$tfsproject,
    [string]$testPlanName,
    [string]$apiversion = '1.0'
    )
    $testPlans = get-ActiveTFSTestPlans -tfsinstance $tfsinstance -tfsproject $tfsproject -apiversion $apiversion
    $testplan = ($testplans.value | ?{$_.name -eq $testPlanName}).id
    if($testplan)
    {
      $testplan
    }
    else
    {
      $null
    }
}