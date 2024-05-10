import 'package:commons/util/constans_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:app_pokenmon/presentation/providers/home_layout_provider.dart';
import 'package:commons/shared/navigation_bar/custom_button_navigation_bar_web.dart';
import 'package:commons/shared/navigation_bar/custom_button_navigation_bar_mobile.dart';

class HomeLayoutView extends StatelessWidget {
  final Widget child;

  const HomeLayoutView({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;

    return ChangeNotifierProvider(
      create: (_) => HomeLayoutProvider()..getItemsTabs(),
      lazy: false,
      child: (kIsWeb && maxWidth > 550)
          ? _ViewWithBottomNavigationWeb(child)
          : _ViewWithBottomNavigationMobile(child),
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
                CustomBottomNavigationBarWeb(
                  onPressed: (element) {
                    context.goNamed(element);
                  },
                  goConfig: () => context.pushNamed(Routes.config),
                ),
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
    final colors = Theme.of(context).colorScheme;
    final provider = context.watch<HomeLayoutProvider>();

    return (provider.items.isNotEmpty)
        ? Scaffold(
            appBar: AppBar(
              title: Text(
                'Pokemon_App',
                style: TextStyle(color: colors.primary),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: IconButton(
                      onPressed: () => context.pushNamed(Routes.config),
                      icon: Icon(
                        Icons.settings,
                        color: colors.primary,
                      )),
                )
              ],
            ),
            body: SafeArea(child: child),
            bottomNavigationBar: CustomBottomNavigationBarMobile(
              onPressed: (element) {
                context.goNamed(element);
              },
              itemsTabs: provider.items,
            ),
          )
        : const Center(
            child: CircularProgressIndicator(),
          );
  }
}
