param($tfsinstance,$tfsproject,$name,$iteration, $description, $area)

Describe 'new-TFSTestPlan' {
$testCases = @(
  @{
    tfsInstance = $tfsinstance
    tfsproject = $tfsproject
    apiVersion = '1.0'
    Name = $name
    area =$area
    iteration = $interation
    startdate = (get-date)
    endDate = ((get-date).AddDays(10))
    description = $description
  }
)
  Context 'WithArgs' {
      It 'does something' -TestCases $testCases{
        param($tfsinstance,$tfsproject, $apiversion, $name, $area, $iteration, $startdate, $enddate, $description)
       $TestPlan = (new-TfsTestPlan -tfsinstance $tfsinstance -tfsproject $tfsproject -apiversion $apiversion -name $name -iteration $iteration -area $area -startdate $startdate -enddate $endDate -description $description)
       $TestPlan | Should exist
    }
  }
    
}