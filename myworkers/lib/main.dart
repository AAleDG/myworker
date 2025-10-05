import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myworkers/core/l10n/arb/core_localizations.dart';
import 'package:myworkers/core/provider/app_multi_bloc.dart';
import 'package:myworkers/core/router/router.dart';
import 'package:myworkers/features/firebase/auth_gate.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GoogleSignInService.initSignIn();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AppMultiBlocProvider(
      child: MaterialApp.router(
        routerConfig: _appRouter.config(),
        supportedLocales: CoreLocalizations.supportedLocales,
        localizationsDelegates: const [
          ...CoreLocalizations.localizationsDelegates,
        ],
        locale: const Locale('it'),
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      ),
    );
  }
}
