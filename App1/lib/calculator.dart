
class Calculator{

  String currInput = '';
  String operator = '';
  String input = '';
  bool isoperation = false;
  String secondInput = '';
  String equation = '';
  bool isResultCalculated = false;
  String display = '';




  String formatNumber(String numStr) {
      if (numStr.isEmpty) return '';
      if (numStr.contains('.')) {
        double value = double.parse(numStr);
        return value.toStringAsFixed(value == value.toInt() ? 0 : 2); // Display as double
      } else {
        int value = int.parse(numStr);
        return value.toString(); // Display as integer
    }
  }


  void addDigit(String digit){
    if (isResultCalculated) {
      clear();
      isResultCalculated = false;
    }
    currInput += digit;
    updateDisplay();
  }
  
  void updateDisplay() {
    if (operator.isNotEmpty) {
      display = '${formatNumber(input)} $operator ${formatNumber(currInput)}';
    } else if (isResultCalculated) {
      display = formatNumber(input); // Only the result
    } else {
      display = formatNumber(currInput);
    }
  }


  void removeLastDigit(){
    if(currInput.isNotEmpty){
      currInput=currInput.substring(0,currInput.length-1);
      updateDisplay();
    }
  }

  void setOperation(String operator1){
    if(currInput.isNotEmpty){
      if(input.isEmpty){
        input=currInput;
        currInput='';
        operator=operator1;
        updateDisplay();
      }
      else{
        calculate();
        operator=operator1;
        updateDisplay();
      }
    }
      
    }
  


  void calculate(){
    if(input.isNotEmpty && currInput.isNotEmpty && operator.isNotEmpty) {
      try{
      double num1 = double.tryParse(input) ?? 0;
      double num2 = double.tryParse(currInput) ?? 0;
      // double num1 = double.parse(input);
      // double num2 = double.parse(currInput);
      double result = 0.0;

    switch(operator){
      case'+':
        result = num1 + num2;
        break;
      case'-':
        result = num1 - num2;
        break;
      case'/':
        if(num2==0) {
          display = 'Error';
          input = '';
          currInput = '';
          operator = '';
          isResultCalculated = true;
          updateDisplay();
          return;        
          } else{
          result = num1 / num2;
          }
        break;
      case'*':
        result = num1 * num2;
        break;
      case'%':
        result=num1 % num2;
        break;
      default:
        break;
      //   return currInput;
    }    
    input = result.toString();
    // equation='$input $operator $secondInput =';
    currInput = '';
    operator='';
    isResultCalculated=true;
    }
    catch(e){
      display = 'Error';
      input = '';
      currInput = '';
      operator = '';
      isResultCalculated = true;
    }
    updateDisplay();
  }
  }

  void clear(){
    currInput='';
    operator='';
    input='';
    isResultCalculated=false;
    display='';
  }
  
  // void numberPressed(double number){
  //     if(currInput != ''){
  //       currInput='';
  //       input=number as String;
  //       return;
  //     }
  //     if(input==''){
  //       input=number as String;
  //       return;
  //     }
  //     if(operator==''){
  //       input=double.parse('$input$number') as String;
  //     }
  //     if(secondInput==0){
  //       secondInput=number as String;
  //       return;
  //     }
  //     secondInput=double.parse('$secondInput$number') as String;
  // }
  
  String get Display => currInput.isEmpty?'0':formatNumber(currInput);
  String get Equation => equation.isEmpty?'':equation;
  
}