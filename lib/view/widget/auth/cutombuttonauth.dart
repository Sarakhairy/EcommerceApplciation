import 'package:ecommerce_application/core/constant/color.dart';
import 'package:flutter/material.dart';

class CutomButtonAuth extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const CutomButtonAuth({super.key, required this.text,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        onPressed: onPressed,
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Text(text,style: TextStyle(fontWeight: FontWeight.bold),),
      color: ColorApp.primaryColor,
      textColor: Colors.white,
      ),
    );
  }
}
