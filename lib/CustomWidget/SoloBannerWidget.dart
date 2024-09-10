import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/models/profile_model.dart';

class SoloBannerWidget extends StatefulWidget {
  ProfileModel profile;

  SoloBannerWidget({Key? key, required this.profile}) : super(key: key);

  @override
  State<SoloBannerWidget> createState() => _soloBannerComponentState();
}

class _soloBannerComponentState extends State<SoloBannerWidget> {
  @override
  Widget build(BuildContext context) {
    return _soloBanner();
  }

  Container _soloBanner(){
    return Container(
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
                  onTap: (){},
                  child: SvgPicture.asset('assets/icons/ProfileSegmentButton.svg'),
                ))
          ],
        ),
      )
    );
  }
}