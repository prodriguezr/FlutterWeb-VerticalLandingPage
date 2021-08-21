import 'package:flutter/material.dart';
import 'package:vertical_landing_page/ui/shared/shared.dart';
import 'package:vertical_landing_page/ui/views/views.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: _homePageDecoration(),
        child: Stack(
          children: [
            _HomePageBody(),
            Positioned(
              top: 10,
              right: 10,
              child: CustomAppMenu(),
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _homePageDecoration() => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.blue,
            Colors.deepOrange,
          ],
          stops: [0.5, 0.5],
        ),
      );
}

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      children: [
        HomeView(),
        ContactView(),
        PricingView(),
        LocationView(),
        AboutView(),
      ],
    );
  }
}
