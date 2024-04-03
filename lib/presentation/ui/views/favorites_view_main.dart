import 'package:flutter/material.dart';

class FavoritesViewMain extends StatelessWidget {
  const FavoritesViewMain({super.key});

    @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Hello Favorites',
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
    );
  }
}