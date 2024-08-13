import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CustomTextFormAuth extends StatelessWidget {
  final int hint;
  final int label;
  final IconData iconData;
  final TextEditingController? mycontroller;
  const CustomTextFormAuth({super.key, required this.hint, required this.label, required this.iconData,required this.mycontroller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        controller: mycontroller,
        
        decoration: InputDecoration(
          
          hintText: "$hint".tr,
          hintStyle: TextStyle(fontSize: 15),
          label: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Text("$label".tr)),
          suffixIcon: Icon(iconData),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
        ),
      ),
    );
  }
}