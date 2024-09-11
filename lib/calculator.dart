import 'package:flutter/material.dart';
import 'package:basicsidebars/navbar.dart';
import 'package:basicsidebars/components/MyTextDecoration.dart';
class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String output = "0";

  void numberButtonPressed(String text){
    setState(() {
      if(output == "0") output = text;
      else{
        output = output + text;
      }
    });
  }
  void clearScreen(){
    setState(() {
      output = "0";
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navbar(),
      appBar: AppBar(
        title: Text("Hello calculator"),
      ),
      body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Text("$output"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: () => numberButtonPressed("7"), child: Text("7")),
                  ElevatedButton(onPressed: () => numberButtonPressed("8"), child: Text("8")),
                  ElevatedButton(onPressed: () => numberButtonPressed("9"), child: Text("9")),
                  ElevatedButton(onPressed: (){}, child: Text("+")),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: (){}, child: Text("4")),
                  ElevatedButton(onPressed: (){}, child: Text("5")),
                  ElevatedButton(onPressed: (){}, child: Text("6")),
                  ElevatedButton(onPressed: (){}, child: Text("-")),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: (){}, child: Text("1")),
                  ElevatedButton(onPressed: (){}, child: Text("2")),
                  ElevatedButton(onPressed: (){}, child: Text("3")),
                  ElevatedButton(onPressed: (){}, child: Text("+")),
                ],
              ),
              ElevatedButton(onPressed: () => clearScreen(), child: Text("Clear")),
            ],
          ),
      )
    );
  }
}
