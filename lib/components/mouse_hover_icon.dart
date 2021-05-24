import 'package:flutter/material.dart';

class MouseHoveIcon extends StatefulWidget {
  final IconData icon;
  final IconData hoveringIcon;

  MouseHoveIcon({
    required this.icon,
    required this.hoveringIcon,
  });

  @override
  _MouseHoveIconState createState() => _MouseHoveIconState();
}

class _MouseHoveIconState extends State<MouseHoveIcon> {
  bool hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      child: Icon(
        hovering ? widget.icon : widget.hoveringIcon,
        color: Colors.red,
      ),
      onEnter: (event) {
        setState(() {
          hovering = true;
        });
      },
      onExit: (event) {
        setState(() {
          hovering = false;
        });
      },
    );
  }
}
