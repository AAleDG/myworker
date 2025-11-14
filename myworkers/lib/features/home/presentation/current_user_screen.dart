import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CurrentUserScreen extends StatelessWidget {
  const CurrentUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: Text('Current user Screen'),
        ),
      ),
    );
  }
}
