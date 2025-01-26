import 'package:app_pokenmon/main_provider.dart';
import 'package:flutter/material.dart';
import 'package:app_pokenmon/router/router.dart';
import 'package:app_pokenmon/service/locator_service.dart';
import 'package:provider/provider.dart';

void main() async {
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

    return ChangeNotifierProvider(
      create: (context) => MainProvider(),
      builder: (context, _) {
        final mainProvider = Provider.of<MainProvider>(context);
        return MaterialApp.router(
          theme: mainProvider.theme,
          debugShowCheckedModeBanner: false,
          title: 'App Pokenmon',
          routerConfig: router,
        );
      },
    );
  }
}
