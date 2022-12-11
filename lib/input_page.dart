import 'package:bmi/calculator_brain.dart';
import 'package:bmi/results_page_screen.dart';
import 'package:bmi/shared/colors.dart';
import 'package:bmi/shared/components.dart';
import 'package:bmi/shared/style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum genderType { male, female }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = mainActiveColor;
  Color femaleCardColor = mainActiveColor;
  int height = 180;
  int weight = 60;
  int age=18;
  genderType? selectedGender;
  void changeColor(genderType genderSelected) {
    maleCardColor = mainActiveColor;
    femaleCardColor = mainActiveColor;
    genderSelected == genderType.male
        ? maleCardColor = mainInActiveColor
        : femaleCardColor = mainInActiveColor;
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MainContainer(
                    function: () => setState(() {
                      selectedGender = genderType.male;
                      print('male');
                    }),
                    color: selectedGender == genderType.male
                        ? mainInActiveColor
                        : mainActiveColor,
                    cardChild: GenderColumn(
                      icon: FontAwesomeIcons.mars,
                      text: "Male",
                    ),
                  ),
                ),
                Expanded(
                  child: MainContainer(
                    function: () {
                      setState(() {
                        selectedGender = genderType.female;
                      });
                    },
                    color: selectedGender == genderType.female
                        ? mainInActiveColor
                        : mainActiveColor,
                    cardChild: GenderColumn(
                      icon: FontAwesomeIcons.venus,
                      text: 'Female',
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: MainContainer(
              color: mainActiveColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'height'.toUpperCase(),
                    style: labelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: numberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: labelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: bottomContainerColor,
                      overlayColor: bottomContainerColor.withOpacity(0.16),
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape:
                          const RoundSliderOverlayShape(overlayRadius: 30),
                      activeTrackColor: Colors.white,
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      inactiveColor: textColor,
                      onChanged: (value) {
                        setState(() {
                          height = value.round();
                        });
                      },
                      max: 200,
                      min: 100,
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MainContainer(
                    color: mainActiveColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Weight'.toUpperCase(),
                          style: labelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: numberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RoundIconButton(
                              child: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  weight++;
                                });
                                print('plus triggered');
                              },
                            ),
                            RoundIconButton(
                              child: FontAwesomeIcons.minus,
                              onPress: () {
                               setState(() {
                                 weight--;
                               });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: MainContainer(
                    color: mainActiveColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'age'.toUpperCase(),
                          style: labelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: numberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RoundIconButton(
                              child: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  age++;
                                });
                                print('plus triggered');
                              },
                            ),
                            RoundIconButton(
                              child: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
          BottomButton(onTap: (){
            CalculatorBrain calc=CalculatorBrain(weight: weight, height: height);

            Navigator.push(context,MaterialPageRoute(builder:(context)=>ResultsPageScreen(bmi: calc.calculateBmi(),interpretations: calc.getInterpretations(),result: calc.result(),)));

          },label: 'calculator',)
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({Key? key, this.child, this.onPress}) : super(key: key);
  final IconData? child;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        child: Icon(
          child,
          color: Colors.white,
        ),
        onPressed: onPress,
        elevation: 6,
        fillColor: const Color(0xFF4C4F5E),
        shape: const CircleBorder(),
        constraints: const BoxConstraints.tightFor(
          width: 56.0,
          height: 56.0,
        ));
  }
}
