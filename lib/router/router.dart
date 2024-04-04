import 'package:fluro/fluro.dart';
import 'package:app_pokenmon/router/main_handlers.dart';
import 'package:commons/util/constans_route.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static void configureRoutes() {
    router.define(ConstansRouter.home,
        handler: homeView, transitionType: TransitionType.fadeIn);

    router.define(ConstansRouter.searchWithParam,
        handler: searchView, transitionType: TransitionType.fadeIn);

    router.define(ConstansRouter.search,
        handler: searchView, transitionType: TransitionType.fadeIn);

    router.define(ConstansRouter.favorites,
        handler: favoritesView, transitionType: TransitionType.fadeIn);

    router.define(ConstansRouter.profile,
        handler: profileView, transitionType: TransitionType.fadeIn);

    router.notFoundHandler = pageNotFound;
  }
}
