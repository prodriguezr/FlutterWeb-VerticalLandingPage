import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';
import 'package:vertical_landing_page/providers/providers.dart';
import 'package:vertical_landing_page/ui/pages/pages.dart';

final homeHandler = Handler(handlerFunc: (context, params) {
  final page = params['page']!.first;

  if (page != '/') {
    final pageProvider = Provider.of<PageProvider>(context!, listen: false);

    pageProvider.createPageController(page);

    return HomePage();
  }
});
