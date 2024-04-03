import 'package:commons/shared/buttons/custom_flat_button.dart';
import 'package:flutter/material.dart';

class View404 extends StatelessWidget {
  const View404({super.key});

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return Container(
      color: Colors.black38,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('404',
                style: TextStyle(
                  fontSize: 40, 
                  fontWeight: FontWeight.bold
                  )
                ),
            const SizedBox(height: 10),
            const Text('No se encontró la página', style: TextStyle(fontSize: 20)),
            CustomFlatButton(
                text: 'Regresar',
                color: colors.primary,
                onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}