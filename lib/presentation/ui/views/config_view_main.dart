import 'package:flutter/material.dart';
import 'dart:js' as js;

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
              const url = 'https://stackoverflow.com/questions/ask';
              js.context.callMethod('open', ['$url', '_self']);
              /*              if (context.canPop()) {
                context.pop();
              } */
            },
          ),
        ),
        body: const Center(
          child: Text(
            'Hello View Test',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ));
  }
}
