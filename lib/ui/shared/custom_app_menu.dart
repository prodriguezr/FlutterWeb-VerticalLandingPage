import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:vertical_landing_page/providers/providers.dart';
import 'package:vertical_landing_page/ui/shared/custom_menu_item.dart';

class CustomAppMenu extends StatefulWidget {
  @override
  _CustomAppMenuState createState() => _CustomAppMenuState();
}

class _CustomAppMenuState extends State<CustomAppMenu>
    with SingleTickerProviderStateMixin {
  bool isOpen = false;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );
  }

  @override
  Widget build(BuildContext context) {
    final pageProvider = Provider.of<PageProvider>(context, listen: false);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          if (isOpen) {
            controller.reverse();
          } else {
            controller.forward();
          }

          setState(() {
            isOpen = !isOpen;
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          width: 150,
          height: isOpen ? 308 : 50,
          color: Colors.black,
          child: Column(
            children: [
              _MenuTitle(isOpen: isOpen, controller: controller),
              if (isOpen) ...[
                CustomMenuItem(
                  text: 'Home',
                  onPressed: () {
                    pageProvider.goTo(0);
                  },
                  onHoverColor: Colors.pinkAccent,
                  onNormalColor: Colors.black,
                ),
                CustomMenuItem(
                  onPressed: () {
                    pageProvider.goTo(1);
                  },
                  text: 'About',
                  onHoverColor: Colors.pinkAccent,
                  onNormalColor: Colors.black,
                ),
                CustomMenuItem(
                  onPressed: () {
                    pageProvider.goTo(2);
                  },
                  text: 'Pricing',
                  onHoverColor: Colors.pinkAccent,
                  onNormalColor: Colors.black,
                ),
                CustomMenuItem(
                  onPressed: () {
                    pageProvider.goTo(3);
                  },
                  text: 'Contact',
                  onHoverColor: Colors.pinkAccent,
                  onNormalColor: Colors.black,
                ),
                CustomMenuItem(
                  onPressed: () {
                    pageProvider.goTo(4);
                  },
                  text: 'Location',
                  onHoverColor: Colors.pinkAccent,
                  onNormalColor: Colors.black,
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuTitle extends StatelessWidget {
  const _MenuTitle({
    Key? key,
    required this.isOpen,
    required this.controller,
  }) : super(key: key);

  final bool isOpen;
  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 50,
      child: Row(
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 400),
            curve: Curves.easeInOut,
            width: isOpen ? 40 : 0,
          ),
          Text(
            'Menu',
            style: GoogleFonts.roboto(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          Spacer(),
          AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            progress: controller,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
