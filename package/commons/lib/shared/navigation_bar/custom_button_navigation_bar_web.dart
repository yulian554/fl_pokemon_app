import 'package:commons/util/constans_route.dart';
import 'package:flutter/material.dart';
import 'package:commons/shared/buttons/custom_flat_button.dart';

class CustomBottomNavigationBarWeb extends StatelessWidget {
  final Function(String) onPressed;
  final Function() goConfig;

  const CustomBottomNavigationBarWeb({
    super.key,
    required this.onPressed,
    required this.goConfig,
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
            onPressed: () => onPressed(Routes.home),
            color: colors.primary,
          ),
          const SizedBox(width: 10),
          CustomFlatButton(
            text: 'Search',
            onPressed: () => onPressed(Routes.search),
            color: colors.primary,
          ),
          const SizedBox(width: 10),
          CustomFlatButton(
            text: 'Favorites',
            onPressed: () => onPressed(Routes.favorites),
            color: colors.primary,
          ),
          const SizedBox(width: 10),
          CustomFlatButton(
            text: 'Profile',
            onPressed: () => onPressed(Routes.profile),
            color: colors.primary,
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
                onPressed: () => goConfig(),
                icon: Icon(
                  Icons.settings,
                  color: colors.primary,
                )),
          )
        ],
      ),
    );
  }
}
