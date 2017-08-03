param($tfsinstance,$tfsproject,$iteration, [int] $depth)
Describe 'Get-TFSClassificationNodes' {

  # scenario 1: call the function without arguments
  Context 'Running without arguments'   {
    # test 1: it does not throw an exception:
    It 'runs without errors' {
      # Gotcha: to use the "Should Not Throw" assertion,
      # make sure you place the command in a 
      # scriptblock (braces):
      { Get-TFSClassificationNodes } | Should  Throw
    }
    }
  Context 'arguments passed'   {
    It 'does not return anything'     {
      Get-TFSClassificationNodes -tfsinstance $tfsinstance -tfsproject $tfsproject -nodeType $iteration -depth $depth| Should not BeNullOrEmpty 
    }
  }
}
