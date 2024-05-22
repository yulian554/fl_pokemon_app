import 'package:flutter/material.dart';

class FavoritesViewMain extends StatelessWidget {
  const FavoritesViewMain({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: LayoutBuilder(
              builder: (context, constraints) => Container(
                color: Colors.green[900],
                child: Center(
                  child: Text(
                    'View 1\n\n' +
                        '[MediaQuery]:\n ${screenSize.width.toStringAsFixed(2)}\n\n' +
                        '[LayoutBuilder]:\n${constraints.maxWidth.toStringAsFixed(2)}',
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: LayoutBuilder(
              builder: (context, constraints) => Container(
                color: Colors.white,
                child: Center(
                  child: Text(
                    'View 2\n\n' +
                        '[MediaQuery]:\n ${screenSize.width.toStringAsFixed(2)}\n\n' +
                        '[LayoutBuilder]:\n${constraints.maxWidth.toStringAsFixed(2)}',
                    style: TextStyle(color: Colors.red[900], fontSize: 18),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
