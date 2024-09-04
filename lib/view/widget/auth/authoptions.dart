import 'package:ecommerce_application/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthOptions extends StatelessWidget {
  final int text;
  final int inkWellText;
  final void Function()? onTap;
  const AuthOptions({super.key, required this.text, required this.inkWellText, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("$text".tr),
        const SizedBox(
          width: 5,
        ),
        InkWell(
          onTap: onTap,
          child: Text("$inkWellText".tr,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: ColorApp.primaryColor)),
        )
      ],
    );
  }
}
