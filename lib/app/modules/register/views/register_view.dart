import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_project/app/modules/widget/button_widget.dart';
import 'package:mini_project/app/modules/widget/text_form_filed_widget.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});
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
              child: Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/Vector 5.png',
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.contain,
                    ),
                    const Text(
                      "Register Your Account",
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
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Username tidak boleh kosong';
                                  }
                                  return null;
                                },
                              )
                            ],
                          ),
                          const SizedBox(height: 10.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Name",
                                style: TextStyle(fontSize: 18.0),
                              ),
                              const SizedBox(height: 5.0),
                              TextFormFiledWidget(
                                controller: controller.nameC,
                                hintText: "Name here....",
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Name tidak boleh kosong';
                                  }
                                  return null;
                                },
                              )
                            ],
                          ),
                          const SizedBox(height: 10.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Address",
                                style: TextStyle(fontSize: 18.0),
                              ),
                              const SizedBox(height: 5.0),
                              TextFormFiledWidget(
                                controller: controller.addressC,
                                hintText: "Address here....",
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Address tidak boleh kosong';
                                  }
                                  return null;
                                },
                              )
                            ],
                          ),
                          const SizedBox(height: 10.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Phone Number",
                                style: TextStyle(fontSize: 18.0),
                              ),
                              const SizedBox(height: 5.0),
                              TextFormFiledWidget(
                                controller: controller.phoneNumberC,
                                hintText: "Phone Number here....",
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Phone Number tidak boleh kosong';
                                  }
                                  return null;
                                },
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
                              Obx(
                                () => TextFormFiledWidget(
                                  controller: controller.passwordC,
                                  hintText: "Password here....",
                                  obscureText:
                                      controller.isPasswordHidden.value,
                                  suffixIcon: IconButton(
                                    onPressed:
                                        controller.tooglePasswordVisibility,
                                    icon: Icon(
                                      controller.isPasswordHidden.value
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Password tidak boleh kosong';
                                    }
                                    return null;
                                  },
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 10.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Confirm Password",
                                style: TextStyle(fontSize: 18.0),
                              ),
                              const SizedBox(height: 5.0),
                              Obx(
                                () => TextFormFiledWidget(
                                  controller: controller.confirmPasswordC,
                                  hintText: "Confirm Password here....",
                                  obscureText:
                                      controller.isConfirmPasswordHidden.value,
                                  suffixIcon: IconButton(
                                    onPressed: controller
                                        .toogleConfirmPasswordVisibility,
                                    icon: Icon(
                                      controller.isConfirmPasswordHidden.value
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Confirm Password tidak boleh kosong';
                                    }
                                    if (value != controller.passwordC.text) {
                                      return 'Password tidak sama';
                                    }
                                    return null;
                                  },
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 20.0),
                          Obx(
                            () => ButtonWidget(
                              title: "Register",
                              onPressed: controller.isLoading.value
                                  ? null
                                  : controller.register,
                            ),
                          ),
                          Row(
                            children: [
                              const Text("Already have an account?"),
                              TextButton(
                                style: TextButton.styleFrom(
                                  textStyle: const TextStyle(
                                    color: Colors.blue,
                                  ),
                                ),
                                onPressed: () => Get.toNamed('/login'),
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
