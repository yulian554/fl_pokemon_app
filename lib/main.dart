import 'package:flutter/material.dart';
import 'package:app_pokenmon/router/router.dart';
import 'package:app_pokenmon/helper/locator.dart';
import 'package:app_pokenmon/config/theme/app_theme.dart';
import 'package:app_pokenmon/presentation/ui/layouts/home_layout_view.dart';

void main() {
  setupLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme(selectedColor: 3).getTheme(),
      debugShowCheckedModeBanner: false,
      title: 'App Pokenmon',
      routerConfig: appRouter,
      builder: (_, child) {
        return Overlay(
          initialEntries: [
            OverlayEntry(
              builder: (_) => HomeLayoutView(child: child ?? Container()),
            )
          ],
        );
      },
    );
  }
}
