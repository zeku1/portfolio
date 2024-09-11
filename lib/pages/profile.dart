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
                  height: 330,
                    width: 390,
                    child: Container(
                      margin: EdgeInsets.only(left: 50),
                        child: AssistanceButton(topMargin: 30.0),
                    )
                ),
                Positioned(

                  bottom: 0.0,
                    child: SoloBannerWidget(profile: widget.profile)
                ),
              ],
            ),
            


          ],
        ),
      ),
    );
  }


}