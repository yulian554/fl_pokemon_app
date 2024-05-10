import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:commons/util/constans_route.dart';

class ProfileViewMain extends StatelessWidget {
  const ProfileViewMain({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        child: const Text('Go Home'),
        onPressed: () {
          context.goNamed(Routes.home);
        });
  }
}
