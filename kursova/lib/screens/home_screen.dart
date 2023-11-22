import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kursova/screens/account_screen.dart';
import 'package:kursova/screens/login_screen.dart';
import 'package:kursova/screens/test.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Main page'),
        actions: [
          IconButton(
            onPressed: () {
              if ((user == null)) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AccountScreen()),
                );
              }
            },
            icon: Icon(
              Icons.person,
              color: (user == null) ? Color.fromARGB(255, 255, 39, 39) : const Color.fromARGB(255, 114, 255, 59),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: (user == null)
              ? const Text("Please register first")
              : Test(),
          //child: Text('для не зареєстрованих користувачів'),
        ),
      ),
    );
  }
}