import 'dart:convert';

class Pdf {
  final String batch;
  final String credits;
  final String department;
  final String pdfUrl;
  final String professor;
  final String semester;
  final String subject;
  final String postedBy;
  final String category;

  Pdf({
    required this.batch,
    required this.credits,
    required this.department,
    required this.pdfUrl,
    required this.professor,
    required this.semester,
    required this.subject,
    required this.postedBy,
    required this.category,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'batch': batch,
      'credits': credits,
      'department': department,
      'pdfUrl': pdfUrl,
      'professor': professor,
      'semester': semester,
      'subject': subject,
      'postedBy': postedBy,
      'category': category,
    };
  }

  factory Pdf.fromMap(Map<String, dynamic> map) {
    return Pdf(
      batch: map['batch'] as String,
      credits: map['credits'] as String,
      department: map['department'] as String,
      pdfUrl: map['pdfUrl'] as String,
      professor: map['professor'] as String,
      semester: map['semester'] as String,
      subject: map['subject'] as String,
      postedBy: map['postedBy'] as String,
      category: map['category'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Pdf.fromJson(String source) =>
      Pdf.fromMap(json.decode(source) as Map<String, dynamic>);
}
