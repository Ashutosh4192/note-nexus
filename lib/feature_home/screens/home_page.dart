// ignore_for_file: non_constant_identifier_names

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:note_nexus/common/app_assets/app_assets.dart';
import 'package:note_nexus/common/variables.dart';
import 'package:note_nexus/feature_aboutus/screens/about_us_page.dart';
import 'package:note_nexus/feature_download/screens/pdf_page.dart';
import 'package:note_nexus/feature_home/controller/home_controller.dart';
import 'package:note_nexus/feature_home/widgets/custom_alert.dart';
import 'package:note_nexus/feature_home/widgets/custom_button.dart';
import 'package:note_nexus/feature_home/widgets/dropdown.dart';
import 'package:note_nexus/feature_login/screens/login_page.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

class HomeVariables {
  var semester_value = "Select semester";
  var department_value = "Select department";
  var subject_value = "Select subject";
  var category_value = "Select category";
  var subject_list = [
    "Select subject",
    "Engineering Mathematics-I",
    "Engineering Physics",
    "Electrical Sciences",
    "Computer Programming",
    "Professional Communication",
    "Engineering Graphics",
  ].map((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(value),
    );
  }).toList();
}

class HomeEnableDisable {
  var subject = false;
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController homeController = Get.find();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (kIsWeb) {
      size = Size(500, size.height);
    }

    return SizedBox(
      width: size.width,
      child: Scaffold(
        extendBody: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
            bottom: Radius.elliptical(size.width, 60),
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
          actions: [
            !kIsWeb
                ? Container()
                : Builder(builder: (context) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 21),
                      child: IconButton(
                        onPressed: () {
                          Scaffold.of(context).openEndDrawer();
                        },
                        icon: const Icon(Icons.menu_rounded),
                        color: Colors.white,
                      ),
                    );
                  })
          ],
        ),
        endDrawer: Drawer(
          width: 280,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
            Radius.circular(0),
          )),
          backgroundColor: Colors.white.withOpacity(1),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const SizedBox(
                height: 20,
              ),
              ListTile(
                title: const Text(
                  'Home',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: const Icon(Icons.home),
                onTap: () {
                  // Update the state of the app
                  // ...
                  navigator!.pop(context);
                },
              ),
              const Divider(),
              ListTile(
                title: const Text('Contribute',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                leading: const Icon(Icons.upload_file_sharp),
                onTap: () {
                  // Update the state of the app
                  // ...
                  navigator!.pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                },
              ),
              const Divider(),
              ListTile(
                title: const Text('About Us',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                leading: const Icon(Icons.person),
                onTap: () {
                  // Update the state of the app
                  // ...
                  navigator!.pushReplacement(MaterialPageRoute(
                      builder: (context) => const AboutUsPage()));
                },
              ),
            ],
          ),
        ),
        body: ResponsiveGridList(
          rowMainAxisAlignment: MainAxisAlignment.spaceEvenly,
          horizontalGridSpacing: size.width * 0.2,
          minItemWidth: 500,
          children: [
            kIsWeb
                ? LottieBuilder.asset(
                    AppAssets.homeAnimation,
                  )
                : Container(),
            Container(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Obx(
                      () => CustomDropdown(
                        items: Variables.departmentList,
                        enabled: homeController.showBranch.value,
                        hintText: "Department",
                        labelText: "Select Department",
                        dropdownitem: DROPDOWNITEMS.branch,
                      ),
                    ),
                    Obx(
                      () => CustomDropdown(
                        items: Variables.semesterList,
                        enabled: homeController.showSemester.value,
                        hintText: "Semester",
                        labelText: "Select Semester",
                        dropdownitem: DROPDOWNITEMS.semester,
                      ),
                    ),
                    Obx(
                      () => CustomDropdown(
                        items:
                            Variables.subjectList[homeController.key!.value] ??
                                [],
                        enabled: homeController.showSubjects.value,
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
                    Custombutton(
                      voidCallback: () {
                        if (homeController.branch == null ||
                            homeController.semester == null ||
                            homeController.subject == null ||
                            homeController.type == null) {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return CustomAlert(
                                    text:
                                        "Please select all the fields to proceed",
                                    voidCallback: () {
                                      navigator!.pop(context);
                                    });
                              });
                          return;
                        } else {
                          navigator!.push(
                            MaterialPageRoute(
                              builder: (context) => PdfPage(
                                subject: homeController.subject!.trim(),
                                department: homeController.branch!.trim(),
                                semester: homeController.semester!.trim(),
                                category: homeController.type!.trim(),
                              ),
                            ),
                          );
                        }
                      },
                      text: "Get docs!",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
