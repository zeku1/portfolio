import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/models/profile_model.dart';
import 'package:portfolio/pages/profile.dart'; // Ensure this import path is correct

class SoloBannerWidget extends StatefulWidget {
  final ProfileModel profile;

  SoloBannerWidget({Key? key, required this.profile}) : super(key: key);

  @override
  State<SoloBannerWidget> createState() => _SoloBannerWidgetState();
}

class _SoloBannerWidgetState extends State<SoloBannerWidget> {
  @override
  Widget build(BuildContext context) {
    return _soloBanner();
  }

  Container _soloBanner(){
    return Container(
      padding: EdgeInsets.only(left: 20),
      width: 393,
      child: Center(
        child: Stack(
          children: [
            Image.asset(
                widget.profile.profileBanner,
              fit: BoxFit.cover,
            ),
            Positioned(
              left: 0.0,
              bottom: 0.0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ProfilePage(profile: widget.profile)) // Ensure ProfilePage is correctly imported
                    );
                  },
                  child: SvgPicture.asset('assets/icons/ProfileSegmentButton.svg'),
                )
            )
          ],
        ),
      ),
    );
  }
}
