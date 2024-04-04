import 'package:go_router/go_router.dart';
import 'package:commons/util/constans_route.dart';
import 'package:app_pokenmon/router/main_page_builder.dart';

final appRouter = GoRouter(
  initialLocation: ConstansRouter.home,
  routes: [
    GoRoute(
      path: ConstansRouter.home,
      name: 'My Home',
      pageBuilder: (_, state) => pageHomeView(state),
    ),
    GoRoute(
      path: ConstansRouter.searchWithParam,
      name: 'My Searc whit params',
      pageBuilder: (_, state) => pageSearchWithView(state),
    ),
    GoRoute(
      path: ConstansRouter.search,
      name: 'My Searc',
      pageBuilder: (_, __) => pageSearchView(),
    ),
  ],
  errorPageBuilder: (_, __) => pageNotFound(),
);
