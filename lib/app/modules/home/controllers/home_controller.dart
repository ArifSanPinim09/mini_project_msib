import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mini_project/app/data/repositories/auth_repository.dart';
import 'package:mini_project/app/data/model/user_model.dart';

class HomeController extends GetxController {
  final AuthRepository _authRepository = AuthRepository();
  final GetStorage _storage = GetStorage();
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  final ImagePicker _picker = ImagePicker();

  Rx<UserModel?> currentUser = Rx<UserModel?>(null);

  @override
  void onInit() {
    super.onInit();
    fetchCurrentUser();
  }

  Future<void> fetchCurrentUser() async {
    String? userId = _storage.read('userId');
    if (userId != null) {
      try {
        currentUser.value = await _authRepository.getCurrentUser(userId);
      } catch (e) {
        print('Error fetching user: $e');
      }
    }
  }

  Future<void> uploadPhoto() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      try {
        final File file = File(image.path);
        final ref = _firebaseStorage
            .ref()
            .child('profile_photos/${currentUser.value!.id}.jpg');
        await ref.putFile(file);

        // Mendapatkan URL foto yang baru diunggah
        final url = await ref.getDownloadURL();
        currentUser.update((user) {
          user?.photoUrl = url;
        });

        // Update URL foto di database (misalnya di Firestore)
        await _updatePhotoUrlInDatabase(url);

        Get.snackbar("Success", "Photo uploaded successfully");
      } catch (e) {
        Get.snackbar("Error", "Failed to upload photo: $e");
      }
    }
  }

  Future<void> updatePhoto() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      try {
        // Upload ke Firebase Storage
        File file = File(image.path);
        final storageRef = _firebaseStorage
            .ref()
            .child('user_photos/${currentUser.value!.id}.jpg');
        await storageRef.putFile(file);

        // Dapatkan URL foto
        String downloadURL = await storageRef.getDownloadURL();

        // Perbarui URL foto di Firestore
        // Perbarui URL foto di Firestore
        await FirebaseFirestore.instance
            .collection('users')
            .doc(currentUser.value!.id)
            .update({'photoUrl': downloadURL});

        // Update currentUser photoUrl
        currentUser.value!.photoUrl = downloadURL;
        currentUser.refresh();
      } catch (e) {
        Get.snackbar("Error", "Failed to upload photo: $e");
      }
    }
  }

  Future<void> deletePhoto() async {
    try {
      final ref = _firebaseStorage
          .ref()
          .child('profile_photos/${currentUser.value!.id}.jpg');
      await ref.delete();

      // Setel photoUrl ke null dalam model pengguna saat foto dihapus
      currentUser.update((user) {
        user?.photoUrl = null;
      });

      // Hapus URL foto di database
      await _updatePhotoUrlInDatabase(null);

      Get.snackbar("Success", "Photo deleted successfully");
    } catch (e) {
      Get.snackbar("Error", "Failed to delete photo: $e");
    }
  }

  // Fungsi untuk memperbarui URL foto di database (misalnya di Firestore)
  Future<void> _updatePhotoUrlInDatabase(String? url) async {
    // Contoh: Firestore instance
    // final docRef = FirebaseFirestore.instance.collection('users').doc(currentUser.value!.id);
    // await docRef.update({'photoUrl': url});
  }
}
