// ignore_for_file: library_private_types_in_public_api

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:note_nexus/feature_aboutus/screens/about_us_page.dart';
import 'package:note_nexus/feature_home/screens/home_page.dart';
import 'package:note_nexus/feature_login/screens/login_page.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  final List<Widget> _navigationItem = [
    const Icon(Icons.home),
    const Icon(Icons.upload_file_rounded),
    const Icon(Icons.person),
  ];

  // List<Widget> widgets = [
  //   Text('Home'),
  //   Text('Search'),
  //   Text('Add'),
  //   Text('Profile'),
  // ];
  int selectedindex = 0;
  PageController pageController = PageController();
  void onTapped(int index) {
    setState(() {
      selectedindex = index;
    });
    pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      // appBar: AppBar(title: Text('Bottom Nav')),
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.blue,
        items: _navigationItem,
        buttonBackgroundColor: Colors.teal,
        backgroundColor: Colors.white.withOpacity(0.1),
        height: 60,
        index: 0,
        animationDuration: const Duration(milliseconds: 500),
        onTap: (index) {
          setState(() {
            onTapped(index);
          });
        },
      ),
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        // scrollBehavior: ,
        // reverse: false,
        // pageSnapping:false ,
        children: const [HomePage(), LoginPage(), AboutUsPage()],
      ),
    );
  }
}
