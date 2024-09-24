import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/Components/assistanceButtonComponent.dart';
import 'package:portfolio/Components/bannerComponent.dart';
import 'package:portfolio/Components/groupContactComponent.dart';
import 'package:portfolio/Components/statsComponent.dart';
import 'package:portfolio/Components/accordionComponent.dart';
import 'package:portfolio/models/accordion_model.dart';
import 'package:portfolio/Components/teamBannerComponent.dart';
import 'package:portfolio/models/profile_model.dart';
import 'package:portfolio/Components/menuBarComponent.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<AccordionModel> genAccordionData = [];
  List<ProfileModel> profiles = [];

  @override
  void initState() {
    super.initState();
    _getAccordionData();
  }

  void _getAccordionData(){
    setState(() {
      genAccordionData = AccordionModel.genData();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MenuBarComponent(),
      backgroundColor: const Color(0xffF0FFFF),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AssistanceButton(topMargin: 75.0,),
            HeroBanner(),
            Stats(),
            Column(
              children: [
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 15, bottom: 10),
                    child: RichText(text: TextSpan(
                        style: TextStyle(
                            fontSize: 21
                        ),
                        children: [
                          TextSpan(
                              text: 'Need ',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  color: Colors.black,
                                ),
                              )
                          ),
                          TextSpan(
                              text: 'help ',
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: Color(0xff7B84FB),
                                      fontWeight: FontWeight.w700
                                  ))
                          ),
                          TextSpan(
                              text: 'on these?',
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: Colors.black
                                  ))
                          )
                        ]
                    ),
                    ),
                  ),
                ),
                AccordionComponent(accordionData: genAccordionData),
              ],
            ),
            TeamBannerComponent(),
            GroupContactComponent(),
          ],
        ),
      ),
    );
  }


}
