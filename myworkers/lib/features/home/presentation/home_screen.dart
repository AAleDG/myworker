import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myworkers/core/router/router.dart';
import 'package:myworkers/features/firebase/auth_gate.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? cf = '';
  Future<void> getData() async {
    print(GoogleSignInService.getCurrentUser()?.uid);
    final userDoc = FirebaseFirestore.instance
        .collection('users')
        .doc(GoogleSignInService.getCurrentUser()?.uid);
    final docSnapshot = await userDoc.get();
    print(docSnapshot.data());
    if (docSnapshot.exists) {
      print('im here');
      setState(() {
        cf = docSnapshot.get('cf');
      });
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getData();
    });
    super.initState();
  }

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
                '${GoogleSignInService.getCurrentUser()?.phoneNumber ?? 'No user'}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                '${cf ?? 'No user'}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                '${GoogleSignInService.getCurrentUser()?.uid ?? 'No user'}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  GoogleSignInService.signOut().then((_) {
                    AutoRouter.of(context).replaceAll(
                      [
                        const InitialRoute(),
                      ],
                    );
                  });
                },
                child: Text('logout'),
              ),
              GestureDetector(
                onTap: () {
                  GoogleSignInService.signInWithGoogle();
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
