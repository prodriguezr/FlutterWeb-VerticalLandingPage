import 'package:fluro/fluro.dart';
import 'package:vertical_landing_page/router/route_handlers.dart';

class MyRouter {
  static final FluroRouter router = FluroRouter();

  static void configureRoutes() {
    // My Routes
    router.define('/:page', handler: homeHandler);

    // Not Found Page Route
    router.notFoundHandler = homeHandler;
  }
}
