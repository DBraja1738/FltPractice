import 'package:flutter/material.dart';
import "package:basicsidebars/navbar.dart";
import "package:basicsidebars/components/Textfield.dart";
import "package:cloud_firestore/cloud_firestore.dart";


class Textfieldtest extends StatefulWidget {
  const Textfieldtest({super.key});

  @override
  State<Textfieldtest> createState() => _TextfieldtestState();
}

class _TextfieldtestState extends State<Textfieldtest> {
  @override
  final TextEditingController _controller = TextEditingController();
  List <String> _submittedTexts = [];

  final CollectionReference textsCollection = FirebaseFirestore.instance.collection("texts");

  Future<void> _saveTextToFirestore(String text) async {
    try{
      await textsCollection.add({
        "submittedText": text,
      });
      print("text added to firestore");
    }
    catch(e){
      print("error: $e");
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Navbar(),
      body: Column(
        children: [
          Text("Input Text"),
          TextField(
            controller: _controller,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green)),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green)),
            ),
          ),
          SizedBox(height: 20,),
          ElevatedButton(
              onPressed: (){
                setState(() {
                  _submittedTexts.add(_controller.text);
                  _saveTextToFirestore(_controller.text);

                });

              },
              child: Text("Submit")
          ),
          Expanded(
              child: ListView.builder(
                itemCount: _submittedTexts.length,
                itemBuilder: (context, index){
                  return Padding(
                      padding: EdgeInsets.symmetric(vertical: 0.5, horizontal: 5.0),
                      child: Text(_submittedTexts[index]),
                      );
                },
              ),
          )
        ],
      ),
    );
  }
}
