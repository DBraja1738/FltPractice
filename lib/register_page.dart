import 'package:flutter/material.dart';
import 'package:basicsidebars/navbar.dart';
import 'package:basicsidebars/components/Textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import "package:basicsidebars/components/MyTextDecoration.dart";
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebase = FirebaseFirestore.instance;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _register() async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
      );
      await userCredential.user?.updateDisplayName(_usernameController.text.trim());
     /* await _firebase.collection("users").doc(userCredential.user!.uid).set({
        "username": _usernameController.text.trim(),
        "email": _emailController.text.trim(),
        "created_at": FieldValue.serverTimestamp(),
      });
     */

      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text("Registration successful")
          )
      );
      Navigator.pop(context);

    }
    catch(e){
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text("Error: $e")
        )
    );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navbar(),
      appBar: AppBar(
        title: Text("hello Register"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text("Username"),
            TextField(
              controller: _usernameController,
              decoration: MyInputDecoration(),
            ),
            Text("Email"),
            TextField(
              controller: _emailController,
              decoration: MyInputDecoration(),
            ),
            Text("Password"),
            TextField(
              controller: _passwordController,
              decoration: MyInputDecoration(),
            ),
            ElevatedButton(
              onPressed: _register,
              child: Text("Register"),
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 100),
                  textStyle: TextStyle(fontSize: 20)),
            )
          ],
        ),
      ),
    );
  }
}



