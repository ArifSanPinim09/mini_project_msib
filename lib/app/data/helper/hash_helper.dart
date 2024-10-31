import 'dart:convert';
import 'package:crypto/crypto.dart';

class HashHelper {
  static String hashPassword(String password) {
    var bytes = utf8.encode(password);
    var digest = sha256.convert(bytes);
    return digest.toString();
  }

  static bool verifyPassword(String password, String hashedPassword) {
    var hashedInput = hashPassword(password);
    return hashedInput == hashedPassword;
  }
}
