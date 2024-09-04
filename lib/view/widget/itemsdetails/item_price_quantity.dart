import 'package:ecommerce_application/core/constant/color.dart';
import 'package:flutter/material.dart';

class ItemPriceQuantity extends StatelessWidget {
  final String price;
  final String count;
  final int discount;
  final String priceBefDisc;
  final void Function()? add;
  final void Function()? delete;

  const ItemPriceQuantity(
      {super.key,
      required this.price,
      required this.count,
      this.add,
      this.delete, required this.discount, required this.priceBefDisc});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            IconButton(onPressed: add, icon: const Icon(Icons.add)),
            Container(
              alignment: Alignment.center,
              height: 30,
              width: 50,
              decoration: BoxDecoration(
                  border: Border.all(color: ColorApp.fourthColor)),
              child: Text(
                count,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            IconButton(onPressed: delete, icon: const Icon(Icons.remove)),
          ],
        ),
        const Spacer(),
        Row(
          children: [
            Text("$price\$",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: ColorApp.primaryColor,
                )),
            SizedBox(
              width: 5,
            ),
            discount > 0
                ? Container(
                  height: 25,
                  alignment: Alignment.bottomRight,
                  child: Text(
                      "${priceBefDisc}\$",
                      style: TextStyle(
                          fontSize: 13, decoration: TextDecoration.lineThrough),
                    ),
                )
                : Text(" "),
                SizedBox(width: 10,)
          ],
        )
      ],
    );
  }
}
