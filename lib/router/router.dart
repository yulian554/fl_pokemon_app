import 'package:flutter/cupertino.dart';
import 'package:app_pokenmon/main.dart';
import 'package:go_router/go_router.dart';
import 'package:commons/util/constans_route.dart';
import 'package:app_pokenmon/router/main_page_builder.dart';
import 'package:app_pokenmon/presentation/ui/layouts/home_layout_view.dart';

mixin RouterMixin on State<MyApp> {
  // final rootNavigatorKey = GlobalKey<NavigatorState>();

  GoRouter? _router;

  GoRouter get router {
    _router ??= GoRouter(
      initialLocation: Routes.homePath,
      // navigatorKey: rootNavigatorKey,
      routes: [
        ShellRoute(
          builder: (context, state, child) {
            return HomeLayoutView(child: child);
          },
          routes: [
            GoRoute(
              path: Routes.homePath,
              name: Routes.home,
              pageBuilder: (_, state) => pageHomeView(state),
            ),
            GoRoute(
              path: Routes.searchWithParamPath,
              name: Routes.searchWithParam,
              pageBuilder: (_, state) => pageSearchWithView(state),
            ),
            GoRoute(
              path: Routes.searchPath,
              name: Routes.search,
              pageBuilder: (_, __) => pageSearchView(),
            ),
            GoRoute(
              path: Routes.favoritesPath,
              name: Routes.favorites,
              pageBuilder: (_, __) => pageFavoritesView(),
            ),
            GoRoute(
              path: Routes.profilePath,
              name: Routes.profile,
              pageBuilder: (_, __) => pageProfileView(),
            ),
          ],
        ),
        GoRoute(
          path: Routes.configPath,
          name: Routes.config,
          pageBuilder: (_, __) => pageConfigView(),
        )
      ],
      errorPageBuilder: (_, state) => pageNotFound(state),
    );

    return _router!;
  }
}
