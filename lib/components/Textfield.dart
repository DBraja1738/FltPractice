import "package:flutter/material.dart";


class MyTextfield extends StatelessWidget {
  const MyTextfield ({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: const EdgeInsets.only(left: 24.0,right: 24.0),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green)),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green))
            ),
          ),
        ],
      ),
    );
  }
}
