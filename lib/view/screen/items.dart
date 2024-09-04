import 'package:ecommerce_application/cotroller/favoritcontroller.dart';
import 'package:ecommerce_application/cotroller/itemscontroller.dart';
import 'package:ecommerce_application/data/model/itemsmodel.dart';
import 'package:ecommerce_application/view/screen/auth/home.dart';
import 'package:ecommerce_application/view/widget/handlingdataview.dart';
import 'package:ecommerce_application/view/widget/home/cutomappbar.dart';
import 'package:ecommerce_application/view/widget/items/categoriesitemswidget.dart';
import 'package:ecommerce_application/view/widget/items/itemswidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Items extends GetView<ItemsControllerImp> {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsControllerImp controller = Get.put(ItemsControllerImp());
    FavoritemController favController = Get.put(FavoritemController());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
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
                print('${controller.isSearch}');
              },
            ),
                      const CategoriesItemsWidget(),
                      GetBuilder<ItemsControllerImp>(builder: (controller) {
                        return HadnlingDataView(
                          statusRequest: controller.statusRequest,
                          widget: controller.isSearch
                ? SearchItems(
                    listDataModel: controller.listData,
                  )
                :GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.items.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2, childAspectRatio: 0.7),
                              itemBuilder: (BuildContext context, index) {
                                favController.isFavorite[controller.items[index]
                                        ['item_id']] =
                                    controller.items[index]['favorite'];
                                return ItemsWidget(
                                  active: true,
                                  itemsModel: ItemsModel.fromJson(
                                      controller.items[index]),
                                );
                              }),
                        );
                      }),
                    ],
                  

        ),
      ),
    );
  }
}
