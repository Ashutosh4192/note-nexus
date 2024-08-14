import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_nexus/common/app_assets/app_assets.dart';
import 'package:note_nexus/feature_aboutus/widgets/profile_widget.dart';
import 'package:note_nexus/feature_home/screens/home_page.dart';
import 'package:note_nexus/feature_login/screens/login_page.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

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
        title: Text(
          "Our Team",
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
                navigator!.pushReplacement(
                    MaterialPageRoute(builder: (context) => const LoginPage()));
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
                navigator!.pop(context);
              },
            ),
          ],
        ),
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ResponsiveGridList(
            rowMainAxisAlignment: MainAxisAlignment.center,
            horizontalGridMargin: 10,
            verticalGridSpacing: 50,
            horizontalGridSpacing: 10,
            minItemWidth: 300,
            maxItemsPerRow: 3,
            children: [
              ProfileWidget(
                imageadd: AppAssets.vivek,
                name: "Vivek Kumar",
                designation: "GS Technical Board",
                github: "https://github.com/curious-vv1",
                linkedIn: "https://www.linkedin.com/in/vivek-kumar13/",
              ),
              ProfileWidget(
                imageadd: AppAssets.shreyash,
                name: "Shreyash Kumar",
                designation: "DevC Lead",
                github: "https://github.com/shreyashkr17",
                linkedIn: "https://www.linkedin.com/in/shreyash-kr/",
              ),
              ProfileWidget(
                imageadd: AppAssets.animesh,
                name: "Animesh Shukla",
                designation: "Project Manager",
                github: "https://github.com/DarkNinja15",
                linkedIn:
                    "https://www.linkedin.com/in/animesh-shukla-356934231/",
              ),
              ProfileWidget(
                imageadd: AppAssets.ashutoshM,
                name: "Ashutosh Mishra",
                designation: "Developer",
                github: "https://github.com/ashutosh-3474",
                linkedIn:
                    "https://www.linkedin.com/in/ashutosh-mishra-46a082238/",
              ),
              ProfileWidget(
                imageadd: AppAssets.ashutoshC,
                name: "Ashutosh Kumar Chaturvedi",
                designation: "Developer",
                github: "https://github.com/Ashutosh4192",
                linkedIn:
                    "https://www.linkedin.com/in/ashutosh-kumar-chaturvedi-441b15256/",
              ),
              ProfileWidget(
                imageadd: AppAssets.divyam,
                name: "Divyam Divesh",
                designation: "Developer",
                github: "https://github.com/divyamD13",
                linkedIn:
                    "https://www.linkedin.com/in/divyam-divesh-361326259/",
              ),
              ProfileWidget(
                imageadd: AppAssets.apoorva,
                name: "Apoorva Singh",
                designation: "Developer",
                github: "https://github.com/Apoorva-6387",
                linkedIn:
                    "https://www.linkedin.com/in/apoorva-singh-88460a257/",
              ),
              ProfileWidget(
                imageadd: AppAssets.mukul,
                name: "Mukul Raj",
                designation: "Developer",
                github: "https://github.com/hi-mukul",
                linkedIn: "https://www.linkedin.com/in/hi-mukul/",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
