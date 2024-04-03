import 'package:app_pokenmon/router/router.dart';
import 'package:flutter/material.dart';

import 'package:app_pokenmon/helper/locator.dart';
import 'package:app_pokenmon/config/theme/app_theme.dart';
import 'package:app_pokenmon/service/navigation_service.dart';
import 'package:app_pokenmon/presentation/ui/layouts/home_layout_view.dart';

void main() {
  setupLocator();
  Flurorouter.configureRoutes();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme(selectedColor: 2).getTheme(),
      debugShowCheckedModeBanner: false,
      title: 'App Pokenmon',
      initialRoute: '/home',
      onGenerateRoute: Flurorouter.router.generator,
      navigatorKey: locator<NavigationService>().navigatorKey,
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
