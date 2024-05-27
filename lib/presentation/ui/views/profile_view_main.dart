import 'package:flutter/material.dart';
import 'dart:js' as js;

class ProfileViewMain extends StatelessWidget {
  const ProfileViewMain({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        child: const Text('Go Home'),
        onPressed: () {
          // context.goNamed(Routes.home);
          const url = 'https://stackoverflow.com/questions/ask';
          js.context.callMethod('open', ['$url', '_self']);
        });
  }
}
