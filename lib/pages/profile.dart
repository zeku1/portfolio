import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/Components/accordionComponent.dart';
import 'package:portfolio/Components/assistanceButtonComponent.dart';
import 'package:portfolio/Components/menuBarComponent.dart';
import 'package:portfolio/CustomWidget/SoloBannerWidget.dart';
import 'package:portfolio/models/profile_model.dart';
import 'package:portfolio/CustomWidget/SocialWidget.dart';
import '../CustomWidget/GradientTextWidget.dart';
import 'home.dart';

class ProfilePage extends StatefulWidget{
  ProfileModel profile;

  ProfilePage({Key? key, required this.profile}) : super(key: key);

  @override
  State<ProfilePage> createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MenuBarComponent(),
      backgroundColor:  const Color(0xffF0FFFF),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(right: 20),
                  height: 330,
                    width: 390,
                    child: Container(
                      padding: EdgeInsets.only(left: 50,right: 0),

                    )
                ),
                Positioned(
                  bottom: 0.0,
                    left:0.0,
                    child: Container(
                        child: SoloBannerWidget(profile: widget.profile))
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: widget.profile.about,
            ),
            Container(
              margin: EdgeInsets.only(top: 50,bottom: 30),
              child: GradientText(
                'Project Gallery',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w900
                  ),
                ),
                gradient: LinearGradient(
                    colors: [
                      Color(0xff877AF9),
                      Color(0xff90DFA8),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight

                ),
              ),
            ),
            Container(
              child: AccordionComponent(accordionData: widget.profile.accordionData),
            ),



            Container(
              margin: EdgeInsets.only(top: 50,bottom: 30),
              child: GradientText(
                'Sound Convincing?',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w900
                  ),
                ),
                gradient: LinearGradient(
                    colors: [
                      Color(0xff877AF9),
                      Color(0xff90DFA8),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight

                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft, // Aligns the text to the left
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 30),
                    child: GradientText(
                      'Let\'s stay connected',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w700
                        ),
                      ),
                      gradient: LinearGradient(
                        colors: [
                          Color(0xffAC85FB),
                          Color(0xff8CE5A3),
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 30, bottom: 25),
                    child: Text(
                        'Feel free to reach out to me on',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 19
                        )
                      ),
                    ),

                  ),
                  Container(
                    margin: EdgeInsets.only(left: 100),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SocialIcon(iconPath: 'assets/icons/fbicon.svg', label: 'Facebook', url: widget.profile.facebookLink),
                          SizedBox(height: 20),
                          SocialIcon(iconPath: 'assets/icons/igicon.svg', label: 'Instagram', url: widget.profile.instagramLink),
                          SizedBox(height: 20),
                          SocialIcon(iconPath: 'assets/icons/giticon.svg', label: 'Github', url: widget.profile.githublink),
                          SizedBox(height: 20),
                          SocialIcon(iconPath: 'assets/icons/LinkedInicon.svg', label: 'LinkedIn', url: widget.profile.linkedinlink),
                          SizedBox(height: 20),
                          SocialIcon(iconPath: 'assets/icons/externalfolioicon.svg', label: 'Portfolio', url: widget.profile.portfolioLink),

                        ]
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 30, bottom: 25, top: 25),
                    child: Text(
                      'I\'d love to hear from you and explore how we can work together!',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 19
                          )
                      ),
                    ),

                  ),
                  
                  
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 25, bottom: 50),
              child: Stack(
                alignment: Alignment.center, // Align children to the center of the Stack
                children: [
                  SvgPicture.asset(
                    'assets/icons/CheckoutSegment.svg',
                    width: 370,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 50, right: 50),
                      child: Align(
                        alignment: Alignment.centerLeft, // Center text in the middle of the Stack
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children:[
                            Text(
                              'Check out the rest of our',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 21,
                                  color: Colors.white
                                )
                              ),
                            ),
                            Text(
                              'Team',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 21,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white
                                )
                              ),
                            ),
                          ]
                        )
                      ),
                  ),

                  Positioned(
                    bottom: 0.0,
                    right: 20.0,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      },
                      child: SvgPicture.asset('assets/icons/ProfileSegmentButton.svg'),
                    ),
                  ),
                ],
              ),
            )

        ]
        ),
      ),
    );
  }


}