import 'package:calculator_app/CalcApp.dart';
import 'package:flutter/material.dart';
import 'package:calculator_app/calculator.dart';
import 'package:auto_size_text/auto_size_text.dart'; 

void main() => runApp(const CalcApp());

class CalcApp extends StatelessWidget{
  const CalcApp({super.key});
  @override
  Widget build(BuildContext context){
    return  MaterialApp(
        theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.grey[800]), // Background color for all buttons
            foregroundColor: MaterialStateProperty.all(Colors.black), // Text color for all buttons
            padding: MaterialStateProperty.all(const EdgeInsets.all(0.0)),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
              borderRadius: 
            BorderRadius.circular(12.0), // Rounded corners
            )),
          ),
        ),
      ),
      home: const CalculationScreen(),
    );
  }  
}


class CalculationScreen extends StatefulWidget {
  const CalculationScreen({super.key});
  @override
  CalculationState createState() => CalculationState();
}

class CalculationState extends State<CalculationScreen> {
final Calculator calculator=Calculator();
  void onPressed(String buttonText){
    setState(() {
      if(buttonText == '='){
        calculator.calculate();
      }
      else if(buttonText=='C'){
        calculator.clear();
      }
      else if(buttonText=='⌫'){
          calculator.removeLastDigit();
      }
      else if(['+','-','/','*','%'].contains(buttonText)){
        calculator.setOperation(buttonText);
      }
      else{
        calculator.addDigit(buttonText);
      }
    });
  }

  @override
  Widget build(BuildContext context){

//////////////////////////////////////////////////////
    
  final mediaQuery = MediaQuery.of(context);
  final screenHeight = mediaQuery.size.height;
  final screenWidth = mediaQuery.size.width;
  // final isLandscape = mediaQuery.orientation == Orientation.landscape;

    // Adjust button height based on orientation
  // final buttonHeight = isLandscape ? screenHeight / 5 : screenHeight / 10;

/////////////////////////////////////////////////////
    
    return Scaffold(
      appBar: AppBar(title:const 
      Text('Calculator'),
      backgroundColor: Colors.blueGrey[900],
      ),
      body: Column(
        children:<Widget> [
          // Container(
          // alignment: Alignment.bottomRight,
          // padding:const EdgeInsets.all(50.0),
          // color: Colors.blueGrey[800],
          // child: AutoSizeText(
          //   calculator.Equation,
          //   style:const TextStyle(fontSize: 24.0,color: Colors.white),
          //   maxLines: 1,
          //   overflow: TextOverflow.ellipsis,
          // ),
          // ),
          Container(
            alignment: Alignment.bottomRight,
            padding: const EdgeInsets.all(60.0),
            color: Colors.blueGrey[800],
            child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            reverse: true,
            child: AutoSizeText(
            calculator.display,
            style:const TextStyle(fontSize: 48.0,color: Colors.white),
            maxLines: 1,
            minFontSize: 24,
            maxFontSize: 48,
            overflow: TextOverflow.ellipsis,
          ),
          ),
          ),
          Expanded(
            flex: 5,
            child: 
          Column( 
            children: [
            _buildButtonRow(
                  ['C', '⌫', '/', '%'],
                  [Colors.red, Colors.orange, Colors.grey, Colors.grey],
                  screenHeight/8,
                ),
                _buildButtonRow(
                  ['7', '8', '9', '*'],
                  null,
                  screenHeight/8,
                ),
                _buildButtonRow(
                  ['4', '5', '6', '-'],
                  null,
                  screenHeight/8,
                ),
                _buildButtonRow(
                  ['1', '2', '3', '+'],
                  null,
                  screenHeight/8,
                ),
                _buildButtonRow(
                  ['00', '0', '.', '='],
                  [Colors.grey, Colors.grey, Colors.grey, Colors.green],
                  screenHeight/8,
                ),  
          ],
          )
          )
        ]
      )
    );
  }


  Widget _buildButtonRow(
    List<String> texts,
    List<Color>? colors,
    double height,
  ) {
    return Flexible(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: List.generate(texts.length, (index) {
          return Expanded(
            child:CalculatorButton(
            buttonText: texts[index],
            onPressed: () => onPressed(texts[index]),
            backgroundColor:
                colors != null && index < colors.length ? colors[index] : Colors.grey[200]!,
            buttonHeight: height,
            
        ),
      );
        }),
      )
      );
  
  }


  // Widget buildButton(String buttonText){
  //   return SizedBox(

  //     // height: buttonSize,
  //     // width: buttonWidth,
  //     child: 
  //   Padding(
  //     padding:const EdgeInsets.all(2.0),
  //     child: ElevatedButton(
  //       onPressed:() => onPressed(buttonText),
  //       style: ButtonStyle(
  //         backgroundColor: MaterialStateProperty.all(Colors.grey[800]),
  //         foregroundColor: MaterialStateProperty.all(Colors.black),
  //         padding: MaterialStateProperty.all(const EdgeInsets.all()),
  //       ),
  //       child:Text(
  //         buttonText,
  //         style:const TextStyle(fontSize: 24.0),
  //       ),
  //     ),
    
  //   )
  //   );
  // }
}
