import 'package:ecommerce_application/core/constant/color.dart';
import 'package:ecommerce_application/core/constant/imageasset.dart';
import 'package:flutter/material.dart';

class CartItemsWidget extends StatelessWidget {
  final String name;
  final String price;
  final String count;
  final String imagename;
  final void Function()? add;
  final void Function()? delete;

  const CartItemsWidget({
    super.key,
    required this.name,
    required this.price,
    required this.count,
    required this.imagename,
    required this.add,
    required this.delete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Row(
          children: [
            Expanded(
                flex: 2,
                child: Image.asset(
                  "${ImageAsset.items}${imagename}",
                  height: 90,
                )),
            Expanded(
                flex: 4,
                child: ListTile(
                  title: Text(
                    name,
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  subtitle: Text(
                    price,
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: ColorApp.primaryColor),
                  ),
                )),
            Expanded(
                child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 30,
                  child: IconButton(
                      onPressed: add,
                      
                      icon: const Icon(Icons.add)),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 30,
                  child: Text(
                    count,
                  ),
                ),
                Container(
                    alignment: Alignment.center,
                    height: 30,
                    child: IconButton(
                        onPressed:delete,
                        
                        icon: const Icon(Icons.remove)))
              ],
            ))
          ],
        ),
      ),
    );
  }
}
