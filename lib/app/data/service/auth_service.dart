import 'package:get_storage/get_storage.dart';

class AuthService {
  static final GetStorage _box = GetStorage();

  static const String _isLoggedInKey = 'isLoggedIn';
  static const String _userIdKey = 'userId';
  static const String _usernameKey = 'username';

  static Future<void> saveLogin(String userId, String username) async {
    await _box.write(_isLoggedInKey, true);
    await _box.write(_userIdKey, userId);
    await _box.write(_usernameKey, username);
  }

  static bool isLoggedIn() {
    return _box.read(_isLoggedInKey) ?? false;
  }

  static String? getUserId() {
    return _box.read(_userIdKey);
  }

  static String? getUsername() {
    return _box.read(_usernameKey);
  }

  static Future<void> logout() async {
    await _box.remove(_isLoggedInKey);
    await _box.remove(_userIdKey);
    await _box.remove(_usernameKey);
  }
}
