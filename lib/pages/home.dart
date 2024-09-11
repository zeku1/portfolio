import 'package:flutter/material.dart';
import 'package:portfolio/Components/assistanceButtonComponent.dart';
import 'package:portfolio/Components/bannerComponent.dart';
import 'package:portfolio/Components/groupContactComponent.dart';
import 'package:portfolio/Components/statsComponent.dart';
import 'package:portfolio/Components/accordionComponent.dart';
import 'package:portfolio/models/accordion_model.dart';
import 'package:portfolio/Components/teamBannerComponent.dart';
import 'package:portfolio/models/profile_model.dart';
import 'package:portfolio/Components/menubarComponent.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

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

  void _getAccordionData() {
    setState(() {
      genAccordionData = AccordionModel.genData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MenuBarComponent(),
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
}
