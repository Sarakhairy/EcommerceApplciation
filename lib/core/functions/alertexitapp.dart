import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

alertExitApp() {
  return Get.defaultDialog(
    title: "52".tr,
    middleText: "53".tr,
    actions: [
      ElevatedButton(onPressed: (){
        exit(0);
      }, child:  Text("54".tr),),
      ElevatedButton(onPressed: (){
       Get.back();
      }, child:  Text("Cancel".tr),),

    ]
  );
  
}
