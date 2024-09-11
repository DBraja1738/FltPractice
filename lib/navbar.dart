import 'package:flutter/material.dart';
import 'package:basicsidebars/login.dart';
import "package:basicsidebars/main.dart";
import 'package:basicsidebars/register_page.dart';
import 'package:basicsidebars/textfieldtest.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:basicsidebars/calculator.dart";
import "package:basicsidebars/FirstScreen.dart";
class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  @override

  User? _currentUser;

  void initState(){
    super.initState();
    _checkUser();
  }
  void _checkUser(){
    setState(() {
      _currentUser = FirebaseAuth.instance.currentUser;
    });
  }

  Future<void> _logout() async {
    await FirebaseAuth.instance.signOut();
    setState(() {
      _currentUser=null;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Logged out"))
    );
  }
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
              accountName: Text(_currentUser?.displayName ?? "Guest"),
              accountEmail: Text(_currentUser?.email ?? "Please login"),
              decoration: BoxDecoration(
                color: Color(0xF01B7900)
              ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyApp()));
            },
            title: Text("Hello home"),
          ),
          ListTile(
            leading: Icon(Icons.login),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginPage()));
            },
            title: Text("Hello login"),
          ),
          ListTile(
            leading: Icon(Icons.app_registration),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>RegisterPage()));
            },
            title: Text("Hello register"),
          ),
          ListTile(
            leading: Icon(Icons.book_rounded),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Textfieldtest()));
            },
            title: Text("Hello printer"),
          ),
          ListTile(
            leading: Icon(Icons.calculate),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Calculator()));
            },
            title: Text("Hello calculator"),
          ),
          ListTile(
            leading: Icon(Icons.mail),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Firstscreen()));
            },
            title: Text("Hello calculator"),
          ),
          if(_currentUser != null)
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
              onTap: _logout,
            ),
          
        ],
      ),
    );
  }
}
