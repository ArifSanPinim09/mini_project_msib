import 'package:get/get.dart';
import 'package:mini_project/app/data/service/auth_service.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  Future<GetNavConfig?> redirectDelegate(GetNavConfig route) async {
    // Cek apakah sudah login
    if (!AuthService.isLoggedIn()) {
      // Jika belum login, redirect ke halaman login
      return GetNavConfig.fromRoute('/login');
    }
    return null;
  }
}
