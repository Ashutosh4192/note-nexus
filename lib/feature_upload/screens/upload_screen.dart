import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_nexus/common/variables.dart';
import 'package:note_nexus/feature_home/screens/home_page.dart';
import 'package:note_nexus/feature_upload/services/firestore_service.dart';
import 'package:note_nexus/feature_upload/widgets/dropdown.dart';
import 'package:note_nexus/feature_login/widgets/custom_button.dart';
import 'package:note_nexus/feature_upload/widgets/custom_textfield.dart';
import 'package:note_nexus/feature_upload/controller/upload_controller.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  UploadController uploadController = Get.find();
  TextEditingController batchController = TextEditingController();
  TextEditingController professorController = TextEditingController();
  TextEditingController creditsController = TextEditingController();
  TextEditingController pdfUrlController = TextEditingController();

  @override
  void dispose() {
    batchController.dispose();
    professorController.dispose();
    creditsController.dispose();
    pdfUrlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          "Contribute!!",
          style: GoogleFonts.audiowide(
            textStyle: const TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
      ),
      bottomNavigationBar: kIsWeb
          ? Container(
              height: 70,
              decoration: const BoxDecoration(
                color: Colors.teal,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        "NoteNexus",
                        style: GoogleFonts.audiowide(
                          textStyle: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(children: [
                    InkWell(
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.home,
                              color: Colors.white,
                            ),
                            Text(
                              "Home",
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          navigator!.pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                          );
                        }),
                    const SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.upload_file_sharp,
                              color: Colors.white,
                            ),
                            Text(
                              "Upload",
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ]),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      onTap: () {
                        navigator!.push(MaterialPageRoute(
                            builder: (context) => const HomePage()));
                      },
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                          Text(
                            "About Us",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ]),
                ],
              ),
            )
          : Container(
              height: 0,
            ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height * 0.8,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Obx(
                () => CustomDropdown(
                  items: Variables.departmentList,
                  enabled: uploadController.showBranch.value,
                  hintText: "Department",
                  labelText: "Select Department",
                  dropdownitem: DROPDOWNITEMS.branch,
                ),
              ),
              Obx(
                () => CustomDropdown(
                  items: Variables.semesterList,
                  enabled: uploadController.showSemester.value,
                  hintText: "Semester",
                  labelText: "Select Semester",
                  dropdownitem: DROPDOWNITEMS.semester,
                ),
              ),
              Obx(
                () => CustomDropdown(
                  items:
                      Variables.subjectList[uploadController.key!.value] ?? [],
                  enabled: uploadController.showSubjects.value,
                  hintText: "Subject",
                  labelText: "Select Subject",
                  dropdownitem: DROPDOWNITEMS.subject,
                ),
              ),
              CustomDropdown(
                items: Variables.categoryList,
                enabled: true,
                hintText: "Category",
                labelText: "Select Category",
                dropdownitem: DROPDOWNITEMS.type,
              ),
              CustomTextfield(
                controller: professorController,
                text: "Professor",
              ),
              CustomTextfield(
                controller: batchController,
                text: "Batch (YYYY-YY)",
              ),
              CustomTextfield(
                controller: creditsController,
                text: "Credits",
              ),
              CustomTextfield(
                controller: pdfUrlController,
                text: "Pdf Url",
              ),
              CustomButton(
                  text: "Upload",
                  voidCallback: () async {
                    if (uploadController.branch == null ||
                        uploadController.semester == null ||
                        uploadController.subject == null ||
                        uploadController.type == null ||
                        professorController.text.isEmpty ||
                        batchController.text.isEmpty ||
                        creditsController.text.isEmpty ||
                        pdfUrlController.text.isEmpty) {
                      Get.snackbar("Error", "Please provide all fields");
                      return;
                    }
                    bool isSuccess = await FirestoreService.upload(
                      uploadController.branch!.trim(),
                      uploadController.semester!.trim(),
                      uploadController.subject!.trim(),
                      uploadController.type!.trim(),
                      professorController.text.trim(),
                      batchController.text.trim(),
                      creditsController.text.trim(),
                      pdfUrlController.text.trim(),
                    );
                    if (isSuccess) {
                      Get.snackbar("Success", "Doc uplaoded successfully");
                    }
                    uploadController.setDefault();
                    professorController.text = "";
                    batchController.text = "";
                    creditsController.text = "";
                    pdfUrlController.text = "";
                  })
            ],
          ),
        ),
      ),
    );
  }
}
