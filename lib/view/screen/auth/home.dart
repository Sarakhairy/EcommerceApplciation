import 'package:ecommerce_application/core/constant/color.dart';
import 'package:ecommerce_application/core/constant/imageasset.dart';
import 'package:ecommerce_application/core/functions/translatedatabase.dart';
import 'package:ecommerce_application/cotroller/homepagecontroller.dart';
import 'package:ecommerce_application/data/model/itemsmodel.dart';
import 'package:ecommerce_application/view/widget/handlingdataview.dart';
import 'package:ecommerce_application/view/widget/home/categorieswidget.dart';
import 'package:ecommerce_application/view/widget/home/cutomappbar.dart';
import 'package:ecommerce_application/view/widget/home/cutomoffersview.dart';
import 'package:ecommerce_application/view/widget/home/itemswidget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomePageControllerImp());
    return GetBuilder<HomePageControllerImp>(
      builder: (controller) => Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView(
            children: [
              CutomAppBar(
                myController: controller.search!,
                searchHint: 62,
                onPressedFavorite: () {
                  Get.toNamed("favoritepage");
                },
                onChanged: (val) {
                  controller.checkSearch(val);
                },
                onPressedSearch: () {
                  controller.onSearch();
                },
              ),
              SizedBox(
                height: 10,
              ),
              HadnlingDataView(
                statusRequest: controller.statusRequest,
                widget: controller.isSearch
                    ? SearchItems(
                        listDataModel: controller.listData,
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomOffersView(
                              title: "A summer surprise",
                              subtitle: "Cashback 20%"),
                          Text("63".tr,
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: ColorApp.fourthColor,
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(
                            height: 10,
                          ),
                          const CategoriesWidget(),
                          const SizedBox(
                            height: 10,
                          ),
                          Text("64".tr,
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: ColorApp.fourthColor,
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(
                            height: 10,
                          ),
                          const ItemsWidget(),
                        ],
                      ),
              ),
            ],
          )),
    );
  }
}

class SearchItems extends GetView<HomePageControllerImp> {
  final List<ItemsModel> listDataModel;
  const SearchItems({super.key, required this.listDataModel});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: listDataModel.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              controller.toProductDetails(listDataModel[index]);
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Card(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Expanded(
                          child: Image.asset(
                              "${ImageAsset.items}${listDataModel[index].itemImage}")),
                      Expanded(
                          flex: 2,
                          child: ListTile(
                            title: Text(translateDatabase(
                                listDataModel[index].itemNameAr!,
                                listDataModel[index].itemName!)),
                            subtitle: Text(translateDatabase(
                                listDataModel[index].categoriesNameAr!,
                                listDataModel[index].categoriesName!)),
                          ))
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
