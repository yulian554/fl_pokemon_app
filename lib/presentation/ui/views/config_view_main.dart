import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ConfigViewMain extends StatelessWidget {
  const ConfigViewMain({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Confg View',
            style: TextStyle(color: colors.primary),
          ),
          leading: BackButton(
            color: colors.primary,
            onPressed: () {
              if (context.canPop()) {
                context.pop();
              }
            },
          ),
        ),
        body: Center(
          child: Column(
            children: [
              const Text(
                'Hello View Test',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              MaterialButton(
                onPressed: () {},
                child: const Text('Navigate'),
              )
            ],
          ),
        ));
  }
}
