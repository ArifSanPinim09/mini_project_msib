import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_project/app/data/model/user_model.dart';
import 'package:mini_project/app/data/repositories/auth_repository.dart';
import 'package:mini_project/app/data/service/auth_service.dart';

class LoginController extends GetxController {
  final AuthRepository _authRepository = AuthRepository();

  final usernameC = TextEditingController();
  final passwordC = TextEditingController();

  RxBool isLoading = false.obs;
  RxBool isPasswordHidden = true.obs;

  // Tambahkan observable untuk status login
  RxBool isLoggedIn = false.obs;

  @override
  void onInit() {
    // Gunakan WidgetsBinding untuk menghindari setState selama build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkAutoLogin();
    });
    super.onInit();
  }

  void checkAutoLogin() {
    // Gunakan isLoggedIn untuk memperbarui state
    isLoggedIn.value = AuthService.isLoggedIn();

    if (isLoggedIn.value) {
      // Gunakan Get.offAllNamed untuk navigasi
      Get.offAllNamed('/home');
    }
  }

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  Future<void> login() async {
    try {
      if (usernameC.text.isEmpty || passwordC.text.isEmpty) {
        _showSnackbar('Error', 'Semua field harus diisi', Colors.red);
        return;
      }

      isLoading.value = true;

      // Login menggunakan repository dengan username
      UserModel user = await _authRepository.loginByUsername(
        usernameC.text,
        passwordC.text,
      );

      // Simpan status login
      await AuthService.saveLogin(user.id ?? '', user.username ?? '');

      // Update status login
      isLoggedIn.value = true;

      // Simpan data user ke GetX controller
      Get.put(UserController(user: user), permanent: true);

      _showSnackbar('Success', 'Login berhasil', Colors.green);
      Get.offAllNamed('/home');
    } catch (e) {
      _showSnackbar('Error', e.toString(), Colors.red);
    } finally {
      isLoading.value = false;
    }
  }

  void _showSnackbar(String title, String message, Color backgroundColor) {
    Get.snackbar(
      title,
      message,
      backgroundColor: backgroundColor,
      colorText: Colors.white,
    );
  }

  @override
  void onClose() {
    usernameC.dispose();
    passwordC.dispose();
    super.onClose();
  }
}

class UserController extends GetxController {
  final UserModel user;

  UserController({required this.user});

  Rx<UserModel> currentUser = UserModel().obs;

  @override
  void onInit() {
    currentUser.value = user;
    super.onInit();
  }
}
