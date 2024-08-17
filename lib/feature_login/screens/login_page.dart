import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:note_nexus/common/app_assets/app_assets.dart';
import 'package:note_nexus/feature_aboutus/screens/about_us_page.dart';
import 'package:note_nexus/feature_home/screens/home_page.dart';
import 'package:note_nexus/feature_login/services/auth_service.dart';
import 'package:note_nexus/feature_login/widgets/custom_button.dart';
import 'package:note_nexus/feature_login/widgets/custom_textfield.dart';
import 'package:note_nexus/feature_upload/screens/upload_screen.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
      appBar: AppBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
          bottom: Radius.elliptical(MediaQuery.of(context).size.width, 60),
        )),
        toolbarHeight: 150,
        backgroundColor: Colors.teal,
        elevation: 0.4,
        centerTitle: true,
        leadingWidth: MediaQuery.of(context).size.width > 600 ? 100 : 0,
        leading: MediaQuery.of(context).size.width > 600
            ? Padding(
                padding: const EdgeInsets.only(left: 21, bottom: 5),
                // width: size.width * 0.3,
                child: Image.asset(
                  "assets/images/logo.png",
                  fit: BoxFit.contain,
                  // width: size.width * 0.3,
                ),
              )
            : Container(),
        title: MediaQuery.of(context).size.width < 500
            ? Text(
                "NoteNexus",
                style: GoogleFonts.audiowide(
                  textStyle: const TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              )
            : Text(
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
            Image.asset('assets/icons/ebook.png', height: 100),
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
                navigator!.pushReplacement(
                    MaterialPageRoute(builder: (context) => const HomePage()));
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
                navigator!.pop(context);
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
        rowMainAxisAlignment: MainAxisAlignment.center,
        horizontalGridMargin: 10,
        verticalGridMargin: 50,
        horizontalGridSpacing: 10,
        minItemWidth: 500,
        maxItemsPerRow: 3,
        children: [
          Lottie.asset(AppAssets.loginAnimation, height: 300),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Admin Only",
                style: GoogleFonts.ibmPlexMono(
                  textStyle: const TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              CustomTextfield(
                  controller: emailController,
                  text: "Email",
                  iconData: Icons.mail,
                  toHide: false),
              CustomTextfield(
                controller: passwordController,
                text: "Password",
                iconData: Icons.password,
                toHide: true,
              ),
              const SizedBox(height: 30),
              isLoading
                  ? const CircularProgressIndicator(
                      color: Colors.teal,
                    )
                  : CustomButton(
                      text: "Login",
                      voidCallback: () async {
                        setState(() {
                          isLoading = true;
                        });
                        bool isSuccess = await AuthService.login(
                            emailController.text.trim(),
                            passwordController.text.trim());
                        if (isSuccess && context.mounted) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const UploadScreen(),
                            ),
                          );
                        }
                        setState(() {
                          isLoading = false;
                        });
                        emailController.text = "";
                        passwordController.text = "";
                      },
                    ),
            ],
          ),
        ],
      ),
    );
  }
}
