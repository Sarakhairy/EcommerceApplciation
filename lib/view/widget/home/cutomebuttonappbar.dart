import 'package:ecommerce_application/core/constant/color.dart';
import 'package:flutter/material.dart';

class CutomeButtonAppBar extends StatelessWidget {
  final void Function()? onPressed;
  final IconData icon;
  bool active;
  CutomeButtonAppBar({
    super.key,
    this.onPressed,
    required this.icon,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MaterialButton(
        onPressed: onPressed,
        child: Icon(icon,
            color: active == true ? ColorApp.primaryColor : Colors.grey[800]),
      ),
    );
  }
}
