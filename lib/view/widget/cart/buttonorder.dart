import 'package:ecommerce_application/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomButtonCart extends StatelessWidget {
  final String buttonText;
  final void Function()? onPressed;
  const CustomButtonCart({super.key, required this.buttonText, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return  Container(
                padding:const  EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
              child: MaterialButton(
                color:ColorApp.primaryColor,
                onPressed: onPressed,
              child: Text(buttonText,style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 15 )),
              ),
              );
  }
}
