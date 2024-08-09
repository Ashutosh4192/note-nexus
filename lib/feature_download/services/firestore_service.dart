import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:note_nexus/feature_download/models/pdf.dart';

class FirestoreService {
  static Future<List<Pdf>> getPdfs(String subject, String department,
      String semester, String category) async {
    List<Pdf> pdfs = [];
    try {
      final snapshots =
          await FirebaseFirestore.instance.collection("assets").get();

      for (final doc in snapshots.docs) {
        if (doc['subject'] == subject &&
            doc['department'] == department &&
            doc['semester'] == semester &&
            doc['category'] == category) {
          pdfs.add(
            Pdf(
                batch: doc['batch'],
                credits: doc['credits'],
                department: doc['department'],
                pdfUrl: doc['pdfUrl'],
                professor: doc['professor'],
                semester: doc['semester'],
                subject: doc['subject'],
                postedBy: doc['postedBy'],
                category: doc['category']),
          );
        }
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
    return pdfs;
  }
}
