import 'package:flutter/material.dart';

class AppBarIcon extends StatelessWidget {
  const AppBarIcon(
      {super.key,
      required this.icon,
      this.iconColor = Colors.black,
      this.onClickHandler,
      this.iconBgColor = const Color(0x83DADADA)});

  final IconData icon;
  final Color iconColor;
  final Color iconBgColor;
  final VoidCallback? onClickHandler;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClickHandler,
      child: Container(
        width: 45.0,
        height: 45.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: iconBgColor,
        ),
        child: Icon(
          icon,
          color: iconColor,
        ),
      ),
    );
  }
}
