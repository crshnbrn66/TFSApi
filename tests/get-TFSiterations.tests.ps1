param($tfsinstance,$tfsproject,$tfsteam)
Describe 'Get-TFSIterations' {

  # scenario 1: call the function without arguments
  Context 'Running without arguments'   {
    # test 1: it does not throw an exception:
    It 'runs without errors' {
      # Gotcha: to use the "Should Not Throw" assertion,
      # make sure you place the command in a 
      # scriptblock (braces):
      { Get-TFSIterations } | Should Throw
    }
    }
   context 'Runs with params' { 
    # test 2: it returns nothing ($null):
    It 'gets iterations'    {
      Get-TFSIterations -tfsinstance $tfsinstance -tfsproject $tfsproject  -tfsteam $tfsteam | should  not beNullOrEmpty
    }
  }
}
