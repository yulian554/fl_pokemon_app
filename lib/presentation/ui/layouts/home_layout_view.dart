import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_pokenmon/router/router.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:app_pokenmon/presentation/providers/home_layout_provider.dart';
import 'package:commons/shared/navigation_bar/custom_button_navigation_bar_web.dart';
import 'package:commons/shared/navigation_bar/custom_button_navigation_bar_mobile.dart';

class HomeLayoutView extends StatelessWidget {
  final Widget child;

  const HomeLayoutView({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        return ChangeNotifierProvider(
          create: (_) => HomeLayoutProvider()..getItemsTabs(),
          lazy: false,
          child: (kIsWeb && constraints.maxWidth > 430)
              ? _ViewWithBottomNavigationWeb(child)
              : _ViewWithBottomNavigationMobile(child),
        );
      },
    );
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
                  appRouter.go(element);
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
            body: SafeArea(child: child),
            bottomNavigationBar: CustomBottomNavigationBarMobile(
              onPressed: (element) {
                appRouter.go(element);
              },
              itemsTabs: provider.items,
            ),
          )
        : const Center(
            child: CircularProgressIndicator(),
          );
  }
}
