import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialIcon extends StatelessWidget {
  final String iconPath;
  final String label;
  final String url;

  SocialIcon({required this.iconPath, required this.label, required this.url});

  // Function to launch the URL
  void _launchURL() async {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _launchURL, // This makes the entire row clickable
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            iconPath,
            height: 40.0, // Adjust icon size
          ),
          SizedBox(width: 15.0), // Space between icon and text
          Text(
            label,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w700
              )
            )
          ),
        ],
      ),
    );
  }
}