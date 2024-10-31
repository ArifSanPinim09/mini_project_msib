import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mini_project/app/data/helper/hash_helper.dart';
import 'package:mini_project/app/data/model/user_model.dart';

class AuthRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //REGISTER
  Future<void> register({
    required UserModel userModel,
  }) async {
    try {
      // Check if username already exists
      var snapshot = await _firestore
          .collection('users')
          .where('username', isEqualTo: userModel.username)
          .get();

      if (snapshot.docs.isNotEmpty) {
        throw Exception('Username already exists');
      }

      // Hash password sebelum disimpan
      String hashedPassword = HashHelper.hashPassword(userModel.password!);
      userModel.password = hashedPassword;

      // Generate unique ID
      String userId = _firestore.collection('users').doc().id;
      userModel.id = userId;

      await _firestore.collection('users').doc(userId).set(userModel.toJson());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // LOGIN BY USERNAME
  Future<UserModel> loginByUsername(String username, String password) async {
    try {
      // Ambil user berdasarkan username
      var snapshot = await _firestore
          .collection('users')
          .where('username', isEqualTo: username)
          .get();

      if (snapshot.docs.isEmpty) {
        throw Exception('Invalid username or password');
      }

      // Verify password
      UserModel user = UserModel.fromJson(snapshot.docs.first.data());
      bool isPasswordValid =
          HashHelper.verifyPassword(password, user.password!);

      if (!isPasswordValid) {
        throw Exception('Invalid username or password');
      }

      return user;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  //GET DATA USER
  Future<UserModel?> getCurrentUser(String userId) async {
    try {
      DocumentSnapshot doc =
          await _firestore.collection('users').doc(userId).get();
      if (doc.exists) {
        return UserModel.fromJson(doc.data() as Map<String, dynamic>);
      }
      return null;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
