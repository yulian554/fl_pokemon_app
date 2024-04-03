import 'package:flutter/material.dart';
import 'package:lobby/views/home/home_view.dart';

class HomeViewMain extends StatelessWidget {

  final String limit;
  final String offset;

  const HomeViewMain({
    super.key, 
    required this.limit, 
    required this.offset
  });

  @override
  Widget build(BuildContext context) {
    return HomeView(limit: limit, offset: offset);
  }
}