import 'package:ecommerce_application/core/constant/color.dart';
import 'package:ecommerce_application/core/constant/imageasset.dart';
import 'package:ecommerce_application/cotroller/settingscontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsController controller = Get.put(SettingsController());
    return Container(
      child: ListView(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                height: Get.width / 3,
                color: ColorApp.secondaryColor,
              ),
              Positioned(
                  top: Get.width / 3.9,
                  child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: const CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.grey,
                        backgroundImage: AssetImage(ImageAsset.avatar),
                      )))
            ],
          ),
          const SizedBox(
            height: 100,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                      title: const Text("Disable Notification"),
                      trailing: Switch(value: true, onChanged: (val) {})),
                  ListTile(
                    onTap: () {
                      Get.toNamed('addressview');
                    },
                    title: const Text("Address"),
                    trailing: const Icon(Icons.location_on_outlined),
                  ),
                  ListTile(
                    onTap: () {},
                    title: const Text("About Us"),
                    trailing: const Icon(Icons.help_outline_rounded),
                  ),
                  ListTile(
                    onTap: () {},
                    title: const Text("Contact us"),
                    trailing: const Icon(Icons.phone_callback_outlined),
                  ),
                  ListTile(
                    onTap: () {
                      controller.logOut();
                    },
                    title: const Text("Logout"),
                    trailing: const Icon(Icons.exit_to_app_outlined),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
