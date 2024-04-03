import 'package:flutter/material.dart';

class ProfileViewMain extends StatelessWidget {
  const ProfileViewMain({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Hello Profile',
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
    );
  }
}