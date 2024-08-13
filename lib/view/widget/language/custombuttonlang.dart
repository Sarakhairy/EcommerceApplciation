import 'package:ecommerce_application/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomButtonLang extends StatelessWidget {
  final String buttonText;
  final void Function()? onPressed;
  const CustomButtonLang({super.key, required this.buttonText, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return  Container(
                padding: EdgeInsets.symmetric(horizontal: 100),
                width: double.infinity,
              child: MaterialButton(
                color:ColorApp.primaryColor,
                onPressed: onPressed,
              child: Text(buttonText,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 15 )),
              ),
              );
  }
}