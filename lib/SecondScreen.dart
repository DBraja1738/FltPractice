import 'package:flutter/material.dart';
import "structs/Mystructure.dart";
class Secondscreen extends StatelessWidget {
  final MyStructure struct;
  Secondscreen({super.key, required this.struct});
  String message="fail";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 100,),
          Text("$message"),
          ElevatedButton(onPressed: (){
            print(struct.message);
          }, child: Text("Show message"))
        ],
      ),
    );
  }
}
