import 'package:ecommerce_application/core/constant/color.dart';
import 'package:flutter/material.dart';

class CutomButtonAuth extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const CutomButtonAuth({super.key, required this.text,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        onPressed: onPressed,
      padding: const EdgeInsets.symmetric(vertical: 10),
      color: ColorApp.primaryColor,
      textColor: Colors.white,
      child: Text(text,style: const TextStyle(fontWeight: FontWeight.bold),),
      ),
    );
  }
}
