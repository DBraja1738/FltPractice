import 'package:flutter/material.dart';
import "structs/Mystructure.dart";
import "package:basicsidebars/SecondScreen.dart";

class Firstscreen extends StatelessWidget {
  Firstscreen({super.key});
  
  final TextEditingController msgController = TextEditingController();
  final TextEditingController numController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello first screen"),
      ),
      body: Column(
        children: [
          Text("message"),
          TextField(
            controller: msgController,
            decoration: InputDecoration(
              border: OutlineInputBorder()
            ),
          ),
          Text("number"),
          TextField(
            controller: numController,
            decoration: InputDecoration(
                border: OutlineInputBorder()
            ),
            keyboardType: TextInputType.number,
          ),
          ElevatedButton(
              onPressed: (){
                MyStructure strukt = MyStructure(msgController.text,int.parse(numController.text.trim().toString()));

                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Secondscreen(struct: strukt)));
              },
              child: Text("GO TO SECOND SCREEN")),
        ],
      ),
    );
  }
}
