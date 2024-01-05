import 'package:awesome_icons/awesome_icons.dart';
import 'package:bmi_cal/results_page.dart';
import 'package:bmi_cal/round_icon_button.dart';

import 'package:flutter/material.dart';
import 'bottom_button.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'calculator_brain.dart';

enum Gender {
  //enum is not constructed inside class
  male,
  female
}

class InputPage extends StatefulWidget {
  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  //variable declaration without initialization i.e making a nullable variable
  // because giving error :- LateInitializationError: Field 'selectedGender' has not been initialized.
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 19;

  // Color malecardColor = inactiveCardColor;
  // Color femalecardColor = inactiveCardColor;

  // void updateColor(Gender selectedgender){
  //   // male=1 and female=2
  //   if(selectedgender == Gender.male){
  //     if(malecardColor == inactiveCardColor){
  //       malecardColor = activeCardColor;
  //       femalecardColor = inactiveCardColor;
  //     }else{
  //       malecardColor = inactiveCardColor;
  //     }
  //   }
  //   if(selectedgender == Gender.female){
  //     if(femalecardColor == inactiveCardColor){
  //       femalecardColor = activeCardColor;
  //       malecardColor = inactiveCardColor;
  //     }else{
  //       femalecardColor = inactiveCardColor;
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0A0E21),
        title: Center(
          child: Text('BMI CALCULATOR'),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedGender = Gender.male;
                  });
                },
                child: ReusableCard(
                  colour: selectedGender == Gender.male
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  cardChild: IconContent(
                    icon: FontAwesomeIcons.mars,
                    label: 'MALE',
                  ),
                ),
              )),
              Expanded(
                  child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedGender = Gender.female;
                  });
                },
                child: ReusableCard(
                  colour: selectedGender == Gender.female? kActiveCardColor: kInactiveCardColor,
                  cardChild: IconContent(
                    icon: FontAwesomeIcons.venus,
                    label: 'FEMALE',
                  ),
                ),
              )),
            ],
          )),
          Expanded(
            child: ReusableCard(
            colour: kActiveCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text(
                'HEIGHT',
                style: kLabelTextStyle,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    height.toString(),
                    style: kNumberTextStyle,
                  ),
                  Text(
                    'cm',
                    style: kLabelTextStyle,
                  )
                ],
              ),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: Colors.white,
                  thumbColor: Color(0xFFEB1555),
                  overlayColor: Color(0x29EB1555),
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0)
                ),
                child: Slider(
                  value: height.toDouble(),
                  min: 120.0,
                  max: 220.0,
                  inactiveColor: Color(0xFF8D8E98),
                  onChanged: (double newValue) {
                    setState(() {
                      height = newValue.round();
                    });
                  }
                ),
              ),
            ]),
          )),
          Expanded(
            child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text(
                    'WEIGHT',
                    style: kLabelTextStyle
                  ),
                  Text(
                    weight.toString(),
                    style: kNumberTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RoundIconButton(
                        icon: FontAwesomeIcons.minus,
                        onPressed: () {
                          setState(() {
                            weight--;
                          });
                        },
                      ),
                      SizedBox(width: 10.0,),
                      RoundIconButton(
                        icon: FontAwesomeIcons.plus,
                        onPressed: () {
                          setState(() {
                            weight++;
                          });
                        },
                      ),
                    ],
                  ),
                ]),
              )),
              Expanded(
                child: ReusableCard(
                colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text(
                    'AGE',
                    style: kLabelTextStyle,
                  ),
                  Text(
                    age.toString(),
                    style: kNumberTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RoundIconButton(
                        icon: FontAwesomeIcons.minus,
                        onPressed: (){
                          setState(() {
                            age--;
                          });
                        },
                      ),
                      SizedBox(width: 10.0),
                      RoundIconButton(
                        icon: FontAwesomeIcons.plus,
                        onPressed: (){
                          setState(() {
                            age++;
                          });
                        },
                      ),
                    ],
                  ),
                ]),
              )),
            ],
          )),
          BottomButton(
            buttonText: 'CALCULATE',
            onTap: (){

              CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);

              Navigator.push(context, MaterialPageRoute(builder: (context) => ResultsPage(
                bmiResult: calc.calculateBMI(),
                resultText: calc.getResult(), 
                interpretation: calc.getInterpretation(),
                )),
              );
            },
          ),
        ],
      ),
    );
  }
}


