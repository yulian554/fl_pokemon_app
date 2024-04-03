import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_pokenmon/helper/locator.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:app_pokenmon/service/navigation_service.dart';
import 'package:app_pokenmon/presentation/providers/home_layout_provider.dart';
import 'package:commons/shared/navigation_bar/custom_button_navigation_bar_web.dart';
import 'package:commons/shared/navigation_bar/custom_button_navigation_bar_mobile.dart';

class HomeLayoutView extends StatelessWidget {
  final Widget child;

  const HomeLayoutView({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => HomeLayoutProvider()..getItemsTabs(),
        lazy: false,
        child: (kIsWeb)
            ? _ViewWithBottomNavigationWeb(child)
            : _ViewWithBottomNavigationMobile(child));
  }
}

class _ViewWithBottomNavigationWeb extends StatelessWidget {
  final Widget child;

  const _ViewWithBottomNavigationWeb(this.child);

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomeLayoutProvider>();

    return (provider.items.isNotEmpty)
        ? Scaffold(
            body: Column(
              children: [
                CustomBottomNavigationBarWeb(onPressed: (element) {
                  locator<NavigationService>().navigateTo(element);
                }),
                Expanded(child: child)
              ],
            ),
          )
        : const Center(
            child: CircularProgressIndicator(),
          );
  }
}

class _ViewWithBottomNavigationMobile extends StatelessWidget {
  final Widget child;

  const _ViewWithBottomNavigationMobile(this.child);

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomeLayoutProvider>();

    return (provider.items.isNotEmpty)
        ? Scaffold(
            body: child,
            bottomNavigationBar: CustomBottomNavigationBarMobile(
                onPressed: (element) {
                  locator<NavigationService>().navigateTo(element);
                },
                itemsTabs: provider.items),
          )
        : const Center(
            child: CircularProgressIndicator(),
          );
  }
}
