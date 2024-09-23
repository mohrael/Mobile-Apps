import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double buttonHeight;


  const CalculatorButton({
    super.key, 
    required this.buttonText,
    required this.onPressed,
    this.backgroundColor = Colors.grey,
    this.textColor = Colors.black,
    required this.buttonHeight,
  });


  @override
  Widget build(BuildContext context){
    return SizedBox(
      height: buttonHeight,
      child: Padding(
        padding:const EdgeInsets.all(2.0),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(backgroundColor),
            foregroundColor: MaterialStateProperty.all(textColor),
            padding: MaterialStateProperty.all(EdgeInsets.zero),
          ),
          // child: Center
          child: Text(
            buttonText,
            style: const TextStyle(fontSize: 24.0),
          ),
        
      ),
      )
    );
  }
}