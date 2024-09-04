import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CutomAppBar extends StatelessWidget {
  final int searchHint;
  final void Function()? onPressedSearch;
  final void Function()? onPressedFavorite;
  final void Function(String)? onChanged;
  final TextEditingController myController;
  const CutomAppBar(
      {super.key,
      required this.searchHint,
      this.onPressedSearch,
      this.onPressedFavorite,
      this.onChanged,
      required this.myController});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: myController,
              onChanged: onChanged,
              decoration: InputDecoration(
                  prefixIcon: IconButton(
                      onPressed: onPressedSearch,
                      icon: const Icon(Icons.search)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20)),
                  filled: true,
                  fillColor: Colors.grey[200],
                  hintText: "$searchHint".tr),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(160),
            ),
            width: 60,
            height: 60,
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: IconButton(
              onPressed: onPressedFavorite,
              icon:
                  Icon(Icons.favorite_border_outlined, color: Colors.grey[600]),
            ),
          ),
        ],
      ),
    );
  }
}
