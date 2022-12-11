import 'package:bmi/shared/colors.dart';
import 'package:bmi/shared/components.dart';
import 'package:bmi/shared/style.dart';
import 'package:flutter/material.dart';

class ResultsPageScreen extends StatelessWidget {
   final String bmi;
   final  String interpretations;
  final String result;
   const ResultsPageScreen({Key? key,required this.bmi,required this.interpretations,required this.result}):super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.all( 20),
              child: Text(
                'Your result',
                style: titleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: MainContainer(
              color: mainActiveColor,
              cardChild:   Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  result.toUpperCase(),

                  style: const TextStyle(fontSize: 25, color: Colors.green),
                ),
                Text(
                 bmi,
                  style: const TextStyle(fontSize: 100,color: Colors.white,fontWeight: FontWeight.bold),
                ),
                Text(
interpretations,                  textAlign: TextAlign.center,

                  style: labelTextStyle,
                ),
              ],
            ),

            ),
          ),
         BottomButton(label: 're-calculate', onTap: (){Navigator.pop(context);})
        ],
      ),
    );
  }
}
