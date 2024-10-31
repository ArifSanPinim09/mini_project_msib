import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_project/app/modules/widget/button_widget.dart';
import 'package:mini_project/app/modules/widget/text_form_filed_widget.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffEEF2FF),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/Vector 5.png',
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(
                    height: 200,
                    child: Image.asset(
                      'assets/images/login_logo 1.png',
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Welcome to Azalea",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Username",
                              style: TextStyle(fontSize: 18.0),
                            ),
                            const SizedBox(height: 5.0),
                            TextFormFiledWidget(
                              controller: controller.usernameC,
                              hintText: "Username here....",
                            )
                          ],
                        ),
                        const SizedBox(height: 10.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Password",
                              style: TextStyle(fontSize: 18.0),
                            ),
                            const SizedBox(height: 5.0),
                            TextFormFiledWidget(
                              controller: controller.passwordC,
                              hintText: "Password here....",
                            )
                          ],
                        ),
                        const SizedBox(height: 20.0),
                        Obx(
                          () => ButtonWidget(
                            title: 'Login',
                            onPressed: controller.isLoading.value
                                ? null
                                : controller.login,
                          ),
                        ),
                        Row(
                          children: [
                            const Text("Don't have an account ?"),
                            TextButton(
                              style: TextButton.styleFrom(
                                textStyle: const TextStyle(
                                  color: Colors.blue,
                                ),
                              ),
                              onPressed: () => Get.toNamed('/register'),
                              child: const Text("Sign in"),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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
}
