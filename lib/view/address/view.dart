import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("69".tr),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){},child: Icon(Icons.add),),
      body: Container(
        child: ListView(
          children: [

          ],
        ),
      ),
    );
  }
}