import 'dart:ffi';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import '../components/my_buttons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
var userInput ="";
var answer="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 9,vertical: 18),
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(height: 29),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(userInput.toString(),style: const TextStyle(color: Colors.white,fontSize: 33,)),
                  ],
                ),
              ),
              const SizedBox(height: 12,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Text(answer.toString(),style: const TextStyle(color: Colors.white,fontSize: 33,)),
                  ],
                ),
              ),
              const SizedBox(height: 85),
              Row(
              children: [
                MyButtons(title: "AC",buttonOnpressed: (){
                  userInput="";
                  answer="";
                  setState(() {
                  });
                },),
                MyButtons(title: "+/-",buttonOnpressed: (){
                  userInput+="+/-";
                  setState(() {
                  });
                }),
                MyButtons(title: "%",buttonOnpressed: (){
                  userInput+="%";
                  setState(() {
                  });
                }),
                MyButtons(title: "/",color: Colors.deepOrange,buttonOnpressed: (){
                  userInput+="/";
                  setState(() {
                  });
                }),
              ],
              ),
              Row(
                children: [
                  MyButtons(title: "7",buttonOnpressed: (){
                    userInput+="7";
                    setState(() {
                    });
                  },),
                  MyButtons(title: "8",buttonOnpressed: (){
                    userInput+="8";
                    setState(() {
                    });
                  }),
                  MyButtons(title: "9",buttonOnpressed: (){
                    userInput+="9";
                    setState(() {
                    });
                  }),
                  MyButtons(title: "x",color: Colors.deepOrange,buttonOnpressed: (){
                    userInput+="×";
                    setState(() {
                    });
                  }),
                ],
              ),

              Row(
                children: [
                  MyButtons(title: "4",buttonOnpressed: (){
                    userInput+="4";
                    setState(() {
                    });
                  },),
                  MyButtons(title: "5",buttonOnpressed: (){
                    userInput+="5";
                    setState(() {
                    });
                  }),
                  MyButtons(title: "6",buttonOnpressed: (){
                    userInput+="6";
                    setState(() {
                    });
                  }),
                  MyButtons(title: "-",color: Colors.deepOrange,buttonOnpressed: (){
                    userInput+="-";
                    setState(() {
                    });
                  }),
                ],
              ),

              Row(
                children: [
                  MyButtons(title: "1",buttonOnpressed: (){
                    userInput+="1";
                    setState(() {
                    });
                  },),
                  MyButtons(title: "2",buttonOnpressed: (){
                    userInput+="2";
                    setState(() {
                    });
                  }),
                  MyButtons(title: "3",buttonOnpressed: (){
                    userInput+="3";
                    setState(() {
                    });
                  }),
                  MyButtons(title: "+",color: Colors.deepOrange,buttonOnpressed: (){
                    userInput+="+";
                    setState(() {
                    });
                  }),
                ],
              ),

              Row(
                children: [
                  MyButtons(title: "0",buttonOnpressed: (){
                    userInput+="0";
                    setState(() {
                    });
                  },),
                  MyButtons(title: ".",buttonOnpressed: (){
                    userInput+=".";    //example compound  assignment= sum=sum+mark or   sum+=mark;
                    setState(() {
                    });
                  }),
                  MyButtons(title: "DEL",buttonOnpressed: (){
                    userInput=userInput.substring(0,userInput.length-1);
                    setState(() {
                    });
                  }),
                  MyButtons(title: "=",color: Colors.deepOrange,buttonOnpressed: (){
                    setState(() {
                      equalPress();
                    });
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
void equalPress(){
    String finalUserInput=userInput.replaceAll("×", "*");
    Parser p=Parser();
    Expression expression=p.parse(finalUserInput);
    ContextModel contextModel=ContextModel();
    double eval=expression.evaluate(EvaluationType.REAL,contextModel);
    answer=eval.toString();
}

}
