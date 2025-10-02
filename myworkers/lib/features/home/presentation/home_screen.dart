import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:myworkers/features/firebase/auth_gate.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue[800]!,
              Colors.red[800]!,
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${AuthService().currentUser?.email ?? 'No user'}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                ),
              ),
              GestureDetector(
                onTap: () {
                  AuthService().signOut();
                },
                child: Text('logout'),
              ),
              GestureDetector(
                onTap: () {
                  AuthService().signInWithGoogleFirebase();
                },
                child: Text('login 2'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
