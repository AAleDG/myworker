import 'package:flutter/material.dart';
import 'package:myworkers/core/l10n/delegates/core_localizations.dart';
import 'package:myworkers/core/provider/app_multi_bloc.dart';
import 'package:myworkers/core/router/router.dart';

void main() {
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
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
