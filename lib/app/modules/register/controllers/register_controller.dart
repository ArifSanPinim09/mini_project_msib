import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:mini_project/app/data/model/user_model.dart';
import 'package:mini_project/app/data/repositories/auth_repository.dart';

class RegisterController extends GetxController {
  final AuthRepository _authRepository = AuthRepository();

  final formKey = GlobalKey<FormState>();
  final usernameC = TextEditingController();
  final nameC = TextEditingController();
  final addressC = TextEditingController();
  final phoneNumberC = TextEditingController();
  final passwordC = TextEditingController();
  final confirmPasswordC = TextEditingController();

  RxBool isLoading = false.obs;
  RxBool isPasswordHidden = true.obs;
  RxBool isConfirmPasswordHidden = true.obs;

  void tooglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void toogleConfirmPasswordVisibility() {
    isConfirmPasswordHidden.value = !isConfirmPasswordHidden.value;
  }

  Future<void> register() async {
    if (formKey.currentState!.validate()) {
      if (passwordC.text != confirmPasswordC.text) {
        Get.snackbar(
          "Gagal",
          "Password tidak sama",
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        return;
      }

      try {
        isLoading(true);
        EasyLoading.show(status: "Loading...");

        UserModel userModel = UserModel(
          username: usernameC.text,
          name: nameC.text,
          address: addressC.text,
          phoneNumber: phoneNumberC.text,
          password: passwordC.text,
        );

        await _authRepository.register(
          userModel: userModel,
        );

        EasyLoading.dismiss();
        Get.snackbar(
          "Berhasil",
          "Pendaftaran berhasil",
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        Get.offAllNamed('/login');
      } catch (e) {
        EasyLoading.dismiss();
        Get.snackbar(
          'Gagal',
          "Pendaftaran gagal: ${e.toString()}",
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      } finally {
        isLoading(false);
      }
    }
  }
}
