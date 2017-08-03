param($tfsinstance,$tfsproject)

Describe 'Get-ActiveTFSTestPlans' {
$testCases = @(
  @{
    tfsInstance = $tfsinstance
    tfsproject = $tfsproject
    apiVersion = '1.0'
  }
)
  Context 'WithArgs' {
      It 'does something' -TestCases $testCases{
        param($tfsinstance,$tfsproject, $apiversion)
       $TestPlans = (Get-ActiveTFSTestPlans -tfsinstance $tfsinstance -tfsproject $tfsproject -apiversion $apiversion )
       $TestPlans | Should exist
    }
  }
    
}