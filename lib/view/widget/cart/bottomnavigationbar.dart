import 'package:ecommerce_application/core/constant/color.dart';
import 'package:ecommerce_application/view/widget/cart/buttonorder.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarCart extends StatelessWidget {
  final String price;
  final String shipping;
  final String totalprice;
  const BottomNavigationBarCart({super.key, required this.price, required this.shipping, required this.totalprice});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Price",
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  "$price\$",
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "shipping",
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  "$shipping\$",
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          const Divider(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Total price",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "$totalprice\$",
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: ColorApp.primaryColor),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          CustomButtonCart(
            buttonText: "place order",
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
