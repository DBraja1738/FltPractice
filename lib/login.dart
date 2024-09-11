import 'package:flutter/material.dart';
import 'package:basicsidebars/navbar.dart';
import 'package:basicsidebars/components/Textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:cloud_firestore/cloud_firestore.dart";
import "package:basicsidebars/main.dart";
import "package:basicsidebars/components/MyTextDecoration.dart";

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  Future<void> _login() async {
    try{
      await _auth.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login success"))
      );
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyApp()));
    }
    catch(e){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error $e"))
      );
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navbar(),
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Column(
        children: [
          Text("Email"),
          TextField(
            decoration: MyInputDecoration(),
            controller: _emailController,
          ),
          Text("Password"),
          TextField(
            decoration: MyInputDecoration(),
            controller: _passwordController,
          ),
          ElevatedButton(
            onPressed: _login,
            child: Text("Login"),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 60),

            ) ,)
        ],
      ),
    );
  }
}



