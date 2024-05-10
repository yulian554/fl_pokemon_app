import 'package:app_pokenmon/router/router.dart';
import 'package:flutter/material.dart';
import 'package:app_pokenmon/helper/locator.dart';
import 'package:app_pokenmon/config/theme/app_theme.dart';

void main() {
  setupLocator();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with RouterMixin {
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    return MaterialApp.router(
      theme: AppTheme(selectedColor: 1).getTheme(),
      debugShowCheckedModeBanner: false,
      title: 'App Pokenmon',
      routerConfig: router,
    );
  }
}
