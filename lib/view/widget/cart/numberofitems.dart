import 'package:ecommerce_application/core/constant/color.dart';
import 'package:flutter/material.dart';

class NumberofItems extends StatelessWidget {
  final String message;
  const NumberofItems({super.key, required this.message});
  @override
  Widget build(BuildContext context) {
    return Container(
            padding:const  EdgeInsets.symmetric(vertical: 5),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: ColorApp.thirdColor,
              borderRadius:  BorderRadius.circular(20),
            ),
            child:  Text(message,textAlign: TextAlign.center,style: const TextStyle(
              color: Colors.white
            ),),
          );
  }
}