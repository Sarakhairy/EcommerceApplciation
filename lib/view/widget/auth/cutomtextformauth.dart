import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextFormAuth extends StatelessWidget {
  final int hint;
  final int label;
  final IconData iconData;
  final TextEditingController? mycontroller;
  final String? Function(String?) valid;
  final String type;
  final bool obscuretext;
  final bool enablesuggestions;
  final bool autoCorrect;
  final void Function()? onPressed;
  
  const CustomTextFormAuth({
    super.key,
    required this.hint,
    required this.label,
    required this.iconData,
    required this.mycontroller,
    required this.valid,
    required this.type,
    required this.obscuretext,
    required this.enablesuggestions,
    required this.autoCorrect,
    this.onPressed,
    
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        style: const TextStyle(fontSize: 15,color: Colors.black),
        keyboardType: type == "phone"
            ? TextInputType.phone
            : type == "email"
                ? TextInputType.emailAddress
                : TextInputType.text,
        obscureText: obscuretext,
        enableSuggestions: enablesuggestions,
        autocorrect: autoCorrect,
        validator: valid,
        controller: mycontroller,
        decoration: InputDecoration(
          hintText: "$hint".tr,
          hintStyle: const TextStyle(fontSize: 15,),
          label: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Text("$label".tr)),
          suffixIcon: IconButton(icon: Icon(iconData),onPressed: onPressed,),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
        ),
      ),
    );
  }
}
