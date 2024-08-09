import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:note_nexus/feature_login/controller/user_controller.dart';

class FirestoreService {
  static Future<bool> upload(
      String department,
      String semester,
      String subject,
      String category,
      String professor,
      String batch,
      String credits,
      String pdfUrl) async {
    final userEmail = Get.find<UserController>().userEmail;
    if (userEmail == null) {
      Get.snackbar("Login First", "You are not logged in");
      return false;
    }
    try {
      await FirebaseFirestore.instance.collection("assets").doc().set({
        "department": department,
        "semester": semester,
        "subject": subject,
        "professor": professor,
        "batch": batch,
        "credits": credits,
        "pdfUrl": pdfUrl,
        "postedBy": userEmail,
        "category": category
      });
      return true;
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
    return false;
  }
}
