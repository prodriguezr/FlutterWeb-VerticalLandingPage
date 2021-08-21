import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomMenuItem extends StatefulWidget {
  final String text;
  final Function onPressed;
  final double? width;
  final double? height;
  final Color? onHoverColor;
  final Color? onNormalColor;

  const CustomMenuItem({
    Key? key,
    required this.text,
    required this.onPressed,
    this.width = 150,
    this.height = 50,
    this.onHoverColor = Colors.transparent,
    this.onNormalColor = Colors.black,
  }) : super(key: key);

  @override
  _CustomMenuItemState createState() => _CustomMenuItemState();
}

class _CustomMenuItemState extends State<CustomMenuItem> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      child: MouseRegion(
        onEnter: (_) => setState(() => isHover = true),
        onExit: (_) => setState(() => isHover = false),
        child: GestureDetector(
          onTap: () => widget.onPressed(),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 400),
            width: widget.width,
            height: widget.height,
            color: isHover ? widget.onHoverColor : widget.onNormalColor,
            child: Center(
              child: Text(
                widget.text,
                style: GoogleFonts.roboto(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
