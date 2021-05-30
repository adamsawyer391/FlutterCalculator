import 'package:flutter/material.dart';

void main() {
  runApp(MyClaculatorApp());
}

class MyClaculatorApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Calculator',
      home: MyCalculator()
    );
  }
}

class MyCalculator extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => Calculator();
}

class Calculator extends State<MyCalculator>{

  //register controllers for text form field - we have 2 TFF
  final controller_numberA = TextEditingController();
  final controller_numberB = TextEditingController();
  final my_form_key = GlobalKey<FormState>();

  String textToShow = "";

  //create function for sum of numbers
  void sum(){
    if(my_form_key.currentState!.validate()){
      int numberA = int.parse(controller_numberA.text);
      int numberB = int.parse(controller_numberB.text);
      int result = numberA + numberB;

      setState(() {
        textToShow = "$numberA + $numberB = $result";
      });
    }
  }

  void subtract(){
    if(my_form_key.currentState!.validate()){
      int numberA = int.parse(controller_numberA.text);
      int numberB = int.parse(controller_numberB.text);
      int result = numberA - numberB;

      setState(() {
        textToShow = "$numberA - $numberB = $result";
      });
    }
  }

  void multiply(){
    if(my_form_key.currentState!.validate()){
      int numberA = int.parse(controller_numberA.text);
      int numberB = int.parse(controller_numberB.text);
      int result = numberA * numberB;

      setState(() {
        textToShow = "$numberA * $numberB = $result";
      });
    }
  }

  void divide(){
    if(my_form_key.currentState!.validate()){
      int numberA = int.parse(controller_numberA.text);
      int numberB = int.parse(controller_numberB.text);
      double result = numberA / numberB;

      setState(() {
        textToShow = "$numberA / $numberB = $result";
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(body: Form(key: my_form_key, child:
      Column(mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextFormField(
          controller: controller_numberA,
            validator: (value){
            if(value!.isEmpty){
              return "Please enter a number";
            }
            },
          decoration: InputDecoration(hintText: "Enter a number"),
          keyboardType: TextInputType.number,
        ),
        TextFormField(
          controller: controller_numberB,
          validator: (value){
            if(value!.isEmpty){
              return "Please enter a number";
            }
          },
          decoration: InputDecoration(hintText: "Enter a number"),
          keyboardType: TextInputType.number,
        ),
        //create result text field
        Text(textToShow, style: TextStyle(fontSize: 20.0),),
        //create our four operator buttons on a row
        Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          ElevatedButton(onPressed: sum, child: Text('+'),),
          ElevatedButton(onPressed: subtract, child: Text('-'),),
          ElevatedButton(onPressed: multiply, child: Text('*'),),
          ElevatedButton(onPressed: divide, child: Text('/'),),
        ],)
      ],)));
  }
}


