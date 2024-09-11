import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/models/profile_model.dart';
import 'package:portfolio/CustomWidget/SoloBannerWidget.dart';

class TeamBannerComponent extends StatefulWidget {
  TeamBannerComponent({ super.key});

  @override
  State<TeamBannerComponent> createState() => _TeamBannerComponent();
}

class _TeamBannerComponent extends State<TeamBannerComponent> {
  List<ProfileModel> profiles = [];

  @override
  void initState() {
    super.initState();
    _getProfiles();
  }

  void _getProfiles(){
    setState(() {
      profiles = ProfileModel.allMembers();
    });
  }

  @override
  Widget build(BuildContext context){
    return _teamBanner();
  }
  
  Container _teamBanner(){
    return Container(
      margin: EdgeInsets.only(top: 50, bottom: 50),
      child: Column(
          children: [
            Stack(
              children: [
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: SvgPicture.asset('assets/icons/HelloSegment.svg')
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 500,
                      width: 393,
                      child: ListView.separated(
                              itemCount: profiles.length,
                              scrollDirection: Axis.horizontal,
                              padding: const EdgeInsets.only(left: 0, right: 0, top:80),
                              separatorBuilder: (context, index) => const SizedBox(width: 10),
                              itemBuilder: (context, index) {
                                return SoloBannerWidget(profile: profiles[index]);
                              },
                            ),
                         ),
                  ],

                )
              ],
            ),
            Container(
              // margin: EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Text.rich(
                  TextSpan(
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 21,
                        // color: Colors.black, // Default color
                      ),
                    ),
                    children: [
                      TextSpan(
                        text: 'We\'re a crew of digital dreamers, coding the future with ',
                      ),
                      TextSpan(
                        text: 'bold ideas ',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                          color: Color(0xff7B84FB),
                          fontWeight: FontWeight.w800,
                          )
                        ),
                      ),
                      TextSpan(
                        text: 'and ',
                      ),
                      TextSpan(
                        text: 'slick designs',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: Color(0xff8CE5A3),
                              fontWeight: FontWeight.w800,
                            )
                        ),
                      ),
                      TextSpan(
                        text: '. From apps to experiences, we’re all about making things that slap. Join us on this ride. ',
                      ),
                    ],
                  ),
                  textAlign: TextAlign.justify, // Justify the text
                ),
              )
              ,
            )
          ]
      ),
    );
  }
}