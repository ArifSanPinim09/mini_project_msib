import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffEEF2FF),
      appBar: AppBar(
        backgroundColor: const Color(0xffEEF2FF),
        title: Obx(() {
          if (controller.currentUser.value == null) {
            return const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Hello", style: TextStyle(fontSize: 20.0)),
                Text("How's your day going?", style: TextStyle(fontSize: 14.0)),
              ],
            );
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Hello, ${controller.currentUser.value!.name}",
                    style: const TextStyle(fontSize: 20.0)),
                const Text("How's your day going?",
                    style: TextStyle(fontSize: 14.0)),
              ],
            );
          }
        }),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.logout),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Obx(() {
              if (controller.currentUser.value?.photoUrl != null) {
                return GestureDetector(
                  onTap: () => _showPhotoOptionsDialog(context),
                  child: CircleAvatar(
                    backgroundImage:
                        NetworkImage(controller.currentUser.value!.photoUrl!),
                  ),
                );
              } else {
                return GestureDetector(
                  onTap: () => _showPhotoOptionsDialog(context),
                  child: const CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                );
              }
            }),
          ),
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Divider(),
                      Obx(() {
                        if (controller.currentUser.value == null) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "My phone number: ${controller.currentUser.value!.phoneNumber ?? 'Not available'}"),
                              Text(
                                  "My address: ${controller.currentUser.value!.address ?? 'Not available'}"),
                            ],
                          );
                        }
                      }),
                    ],
                  ),
                ),
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffD567CD),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () => _showPhotoOptionsDialog(context),
                      child: const Center(
                        child: Text(
                          "Manage Photo",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Image.asset(
                  'assets/images/Vector 31.png',
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill,
                ),
                Image.asset(
                  'assets/images/Vector 41.png',
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showPhotoOptionsDialog(BuildContext context) {
    Get.dialog(
      AlertDialog(
        title: const Text("Manage Profile Photo"),
        content: const Text("Choose an option to manage your profile photo."),
        actions: [
          TextButton(
            onPressed: () async {
              await controller.uploadPhoto();
              Get.back();
            },
            child: const Text("Upload New Photo"),
          ),
          TextButton(
            onPressed: () async {
              await controller.updatePhoto();
              Get.back();
            },
            child: const Text("Change Photo"),
          ),
          TextButton(
            onPressed: () async {
              await controller.deletePhoto();
              Get.back();
            },
            child: const Text("Delete Photo"),
          ),
          TextButton(
            onPressed: () => Get.back(),
            child: const Text("Cancel"),
          ),
        ],
      ),
    );
  }
}
