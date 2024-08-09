import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_nexus/common/app_assets/app_assets.dart';
import 'package:note_nexus/feature_download/models/pdf.dart';
import 'package:note_nexus/feature_download/screens/pdf_view.dart';
import 'package:note_nexus/feature_download/services/firestore_service.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:url_launcher/url_launcher.dart';

class PdfPage extends StatefulWidget {
  const PdfPage(
      {super.key,
      required this.department,
      required this.semester,
      required this.category,
      required this.subject});
  final String subject;
  final String department;
  final String semester;
  final String category;

  @override
  State<PdfPage> createState() => _PdfPageState();
}

class _PdfPageState extends State<PdfPage> {
  List<Pdf> pdfs = [];
  bool isLoading = false;

  @override
  void initState() {
    getPdfs();
    super.initState();
  }

  void getPdfs() async {
    setState(() {
      isLoading = true;
    });
    pdfs = await FirestoreService.getPdfs(
        widget.subject, widget.department, widget.semester, widget.category);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
            bottom: Radius.elliptical(MediaQuery.of(context).size.width, 60),
          )),
          toolbarHeight: 150,
          backgroundColor: Colors.teal,
          elevation: 0.4,
          centerTitle: true,
          title: Text(
            "NoteNexus",
            style: GoogleFonts.audiowide(
              textStyle: const TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
        ),
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(
                color: Colors.teal,
              ))
            : (width >= 720)
                ? ResponsiveGridList(
                    minItemWidth: 350,
                    maxItemsPerRow: 3,
                    children: List.generate(
                      pdfs.length,
                      (index) {
                        final pdfFile = pdfs[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 200,
                            width: 200,
                            child: Material(
                              elevation: 3,
                              borderRadius: BorderRadius.circular(15),
                              child: Stack(
                                alignment: AlignmentDirectional.bottomEnd,
                                children: [
                                  ListTile(
                                    // minTileHeight: 130,
                                    hoverColor: Colors.tealAccent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      side: const BorderSide(
                                        color: Colors.black,
                                      ),
                                    ),
                                    leading: SizedBox(
                                      height: 50,
                                      width: 50,
                                      child: Image.asset(
                                        AppAssets.sheet,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    title: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              pdfFile.department,
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(
                                              width: 50,
                                            ),
                                            Text(
                                              "Semester: ${pdfFile.semester}",
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          pdfFile.subject,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              pdfFile.category,
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(
                                              width: 50,
                                            ),
                                            Text(
                                              "Batch: ${pdfFile.batch}",
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "By: ${pdfFile.professor}",
                                          style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                    onTap: () async {
                                      if (kIsWeb) {
                                        final Uri url =
                                            Uri.parse(pdfFile.pdfUrl);
                                        if (!await launchUrl(url)) {
                                          throw 'Could not launch $url';
                                        }
                                      } else {
                                        try {
                                          await Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  PdfView(url: pdfFile.pdfUrl),
                                            ),
                                          );
                                        } catch (e) {
                                          // print('Navigation Error: $e');
                                        }
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                : ListView.builder(
                    itemCount: pdfs.length,
                    itemBuilder: (context, index) {
                      final pdfFile = pdfs[index];
                      return Padding(
                        padding:
                            const EdgeInsets.only(top: 20, left: 10, right: 10),
                        child: Material(
                          borderRadius: BorderRadius.circular(15),
                          elevation: 3,
                          child: Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children: [
                              ListTile(
                                minTileHeight: 70,
                                hoverColor: Colors.tealAccent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  side: const BorderSide(
                                    color: Colors.black,
                                  ), //
                                ),
                                leading: SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: Image.asset(
                                    AppAssets.sheet,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          pdfFile.department,
                                          style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          width: 50,
                                        ),
                                        Text(
                                          "Semester: ${pdfFile.semester}",
                                          style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      pdfFile.subject,
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          pdfFile.category,
                                          style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        const SizedBox(
                                          width: 50,
                                        ),
                                        Text(
                                          'Batch: ${pdfFile.batch}',
                                          style: const TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      'By: ${pdfFile.professor}',
                                      style: const TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                onTap: () async {
                                  if (kIsWeb) {
                                    final Uri url = Uri.parse(pdfFile.pdfUrl);
                                    if (!await launchUrl(url)) {
                                      throw 'Could not launch $url';
                                    }
                                  } else {
                                    try {
                                      await Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              PdfView(url: pdfFile.pdfUrl),
                                        ),
                                      );
                                    } catch (e) {
                                      // print('Navigation Error: $e');
                                    }
                                  }
                                },
                              ),
                              if (!kIsWeb)
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.2),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(18),
                                      bottomRight: Radius.circular(15),
                                    ),
                                  ),
                                  child: Center(
                                    child: IconButton(
                                      padding: const EdgeInsets.all(3),
                                      onPressed: () {
                                        FileDownloader.downloadFile(
                                          url: pdfFile.pdfUrl,
                                          onDownloadCompleted: (value) {
                                            showDialog(
                                              context: context,
                                              builder: (ctx) => AlertDialog(
                                                title: const Text(
                                                    'Downloaded Successfully'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(ctx);
                                                    },
                                                    child: const Text('Ok'),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      icon: const Icon(Icons.download_sharp,
                                          size: 30.0, color: Colors.teal),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      );
                    },
                  ));
  }
}
