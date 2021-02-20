import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_Content.dart';

const bottomContainerHeight = 80;
const activeCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF111238);
enum Gender {
 male , female
}
const bottomContainerColor = Color(0xFFEB1555);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = inactiveCardColor;
  Color femaleCadColor = inactiveCardColor;
void UpdateColor (Gender selectedGender){
  if(selectedGender == Gender.male){
    if(maleCardColor == inactiveCardColor){
      femaleCadColor = inactiveCardColor;
      maleCardColor = activeCardColor;
    }else{
      maleCardColor = inactiveCardColor;
    }
  }
  if(selectedGender == Gender.female){
    femaleCadColor = activeCardColor;
    maleCardColor = inactiveCardColor;
  }else{
    femaleCadColor = inactiveCardColor;
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      setState(() {
                        UpdateColor(Gender.male);
                      });
                    },
                    child: ReusableCard(
                      colour: inactiveCardColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: "Male",
                      ),
                    ),
                  )),
                  Expanded(
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                              UpdateColor(Gender.female);
                          });
                        },
                        child: ReusableCard(
                            colour: activeCardColor,
                            cardChild: IconContent(
                              icon: FontAwesomeIcons.venus,
                              label: "Female",
                            )),
                      )),
                ],
              ),
            ),
            Expanded(
                child: ReusableCard(
              colour: Color(0xFF1D1E33),
            )),
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                    child: ReusableCard(
                  colour: Color(0xFF1D1E33),
                )),
                Expanded(
                    child: ReusableCard(
                  colour: Color(0xFF1D1E33),
                ))
              ],
            )),
          ],
        ));
  }
}
