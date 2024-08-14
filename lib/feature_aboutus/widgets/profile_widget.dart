import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({
    super.key,
    required this.imageadd,
    required this.name,
    required this.designation,
    required this.github,
    required this.linkedIn,
  });
  final String imageadd;
  final String name;
  final String designation;
  final String linkedIn;
  final String github;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 60,
          backgroundImage: AssetImage(imageadd),
        ),
        const SizedBox(height: 16),
        Text(
          name,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 11,vertical: 5),
          decoration: BoxDecoration(color: Colors.teal, borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 11,vertical: 5),
            child: Text(
              designation,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(
              onTap: () async {
                final Uri url = Uri.parse(linkedIn);
                if (!await launchUrl(url)) {
                  throw 'Could not launch $url';
                }
              },
              child: SvgPicture.asset(
                'assets/images/linkedin.svg',
                semanticsLabel: 'LinkedInImage',
                height: 40,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            InkWell(
              onTap: () async {
                final Uri url = Uri.parse(github);
                if (!await launchUrl(url)) {
                  throw 'Could not launch $url';
                }
              },
              child: SvgPicture.asset(
                'assets/images/github.svg',
                semanticsLabel: 'GithubImage',
                height: 40,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
