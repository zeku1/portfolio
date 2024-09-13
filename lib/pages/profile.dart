import 'package:flutter/material.dart';
import 'package:portfolio/Components/assistanceButtonComponent.dart';
import 'package:portfolio/Components/menuBarComponent.dart';
import 'package:portfolio/CustomWidget/SoloBannerWidget.dart';
import 'package:portfolio/models/profile_model.dart';

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
                        child: AssistanceButton(topMargin: 30.0),
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
            )




          ],
        ),
      ),
    );
  }


}