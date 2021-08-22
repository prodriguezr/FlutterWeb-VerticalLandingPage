//import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;

class PageProvider extends ChangeNotifier {
  List<String> _pages = ['home', 'about', 'pricing', 'contact', 'location'];
  int _currentIndex = 0;

  PageController? pageController;

  createPageController(String routeName) {
    this.pageController = PageController(initialPage: getPageIndex(routeName));
    html.document.title = _capitalize(_pages[getPageIndex(routeName)]);

    this.pageController!.addListener(() {
      final index = (this.pageController!.page ?? 0).round();

      if (index != _currentIndex) {
        html.document.title = _capitalize(_pages[index]);
        html.window.history.pushState(null, 'none', '#/${_pages[index]}');

        _currentIndex = index;
      }
    });
  }

  String _capitalize(String s) => s[0].toUpperCase() + s.substring(1);

  int getPageIndex(String routeName) {
    return _pages.indexOf(routeName) < 0 ? 0 : _pages.indexOf(routeName);
  }

  goTo(int index) {
    pageController?.animateToPage(
      index,
      duration: Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
    html.document.title = _capitalize(_pages[index]);
  }
}
