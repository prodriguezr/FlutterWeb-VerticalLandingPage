import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppMenu extends StatefulWidget {
  @override
  _CustomAppMenuState createState() => _CustomAppMenuState();
}

class _CustomAppMenuState extends State<CustomAppMenu> {
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          print('Click');
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          width: 150,
          height: 50,
          color: Colors.black,
          child: Row(
            children: [
              Text(
                'Menu',
                style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              Spacer(),
              Icon(
                Icons.menu,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
