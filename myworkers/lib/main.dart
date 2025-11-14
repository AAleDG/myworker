import 'package:flutter/material.dart';
import 'package:myworkers/core/l10n/arb/core_localizations.dart';
import 'package:myworkers/core/provider/app_multi_bloc.dart';
import 'package:myworkers/core/router/router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    debug: true,
    url: 'https://hnsgnmmmnwwfdonwohra.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imhuc2dubW1tbnd3ZmRvbndvaHJhIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjA4MjQyOTgsImV4cCI6MjA3NjQwMDI5OH0.1MaUYq6WSDzVn2gbMTa3at0OK-qEXzMOBZ3Kdrast9k',
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
