import 'package:flutter/material.dart';
import 'package:commons/shared/buttons/custom_flat_button.dart';

class View404 extends StatelessWidget {
  final String message;
  final Function goBack;

  const View404({
    super.key,
    required this.message,
    required this.goBack,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      color: Colors.black,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '404',
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(height: 10),
            Text(
              message,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            CustomFlatButton(
              text: 'Regresar',
              color: colors.primary,
              onPressed: () => goBack(),
            )
          ],
        ),
      ),
    );
  }
}
