import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:note_nexus/feature_login/controller/user_controller.dart';

class AuthService {
  static Future<bool> login(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Get.find<UserController>().userEmail = email;
      return true;
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
    return false;
  }
}
