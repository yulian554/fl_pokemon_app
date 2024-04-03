import 'package:commons/util/constans_route.dart';
import 'package:flutter/material.dart';
import 'package:commons/shared/buttons/custom_flat_button.dart';

class CustomBottomNavigationBarWeb extends StatelessWidget {

  final Function(String) onPressed;

  const CustomBottomNavigationBarWeb({
    super.key, 
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: double.infinity,
      child: Row(
        children: [
          CustomFlatButton(
            text: 'Home',
            onPressed: () => onPressed(ConstansRouter.home),
            color: colors.primary,
          ),
          const SizedBox(width: 10),
          CustomFlatButton(
            text: 'Search',
            onPressed: () => onPressed(ConstansRouter.search),
            color: colors.primary,
          ),
          const SizedBox(width: 10),
          CustomFlatButton(
            text: 'Favorites',
            onPressed: () => onPressed(ConstansRouter.favorites),
            color: colors.primary,
          ),
          const SizedBox(width: 10),
          CustomFlatButton(
            text: 'Profile',
            onPressed: () => onPressed(ConstansRouter.profile),
            color: colors.primary,
          )
        ],
      ),
    );
  }
}