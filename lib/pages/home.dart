import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/Components/assistanceButtonComponent.dart';
import 'package:portfolio/Components/bannerComponent.dart';
import 'package:portfolio/Components/groupContactComponent.dart';
import 'package:portfolio/Components/statsComponent.dart';
import 'package:portfolio/Components/accordionComponent.dart';
import 'package:portfolio/models/accordion_model.dart';
import 'package:portfolio/Components/teamBannerComponent.dart';
import 'package:portfolio/models/profile_model.dart';

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
    // TODO: implement initState
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
      appBar: appBar(),
      backgroundColor: const Color(0xffF0FFFF),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AssistanceButton(),
            HeroBanner(),
            Stats(),
            AccordionComponent(accordionData: genAccordionData),
            TeamBannerComponent(),
            GroupContactComponent(),
          ],
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      toolbarHeight: 120.0,
      titleSpacing: 50,
      flexibleSpace: Container(
        margin: EdgeInsets.only(top:25),
        decoration: BoxDecoration(
          color: const Color(0xffF0FFFF),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(15.0), // Adjust the radius as needed
            bottomRight: Radius.circular(15.0), // Adjust the radius as needed
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 10,
              blurRadius: 15,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        padding: const EdgeInsets.fromLTRB(40, 5, 40, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              // margin: const EdgeInsets.all(15),
              alignment: Alignment.center,
              child: SvgPicture.asset(
                'assets/icons/logo.svg',
                width: 60,
                height: 60,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.only(top: 5.0),
                height: 45,
                width: 90,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      colors: [Color(0xff7981FC), Color(0xff8BE5DC)]),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Center(
                  child: Text(
                    'Menu',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.transparent, // Make AppBar background transparent
      elevation: 0, // Remove default shadow
    );
  }
}
