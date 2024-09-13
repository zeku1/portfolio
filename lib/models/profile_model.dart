import 'package:flutter/material.dart';
import 'package:portfolio/CustomWidget/loyceAboutWidget.dart';
import 'package:portfolio/models/accordion_model.dart';

class ProfileModel {

  String name;
  Widget about;
  String facebookLink;
  String instagramLink;
  String githublink;
  String linkedinlink;
  String portfolioLink;
  String profileBanner;
  List<AccordionModel> accordionData;
  List<String> achievements;

  ProfileModel({
    required this.name ,
    required this.about ,
    required this.facebookLink ,
    required this.instagramLink ,
    required this.githublink ,
    required this.linkedinlink,
    required this.portfolioLink ,
    required this.profileBanner,
    required this.accordionData ,
    required this.achievements ,
  });

  static ProfileModel loyceProfile(){
    List<AccordionModel> loyceProj = AccordionModel.getloyceProj();

    ProfileModel loyceProf = ProfileModel(
        name: 'Loyce Nantes',
        about: LoyceAbout(name: 'Loyce Nantes'),
        facebookLink: 'https://www.facebook.com/Wiwisittt',
        instagramLink: 'https://www.instagram.com/luwisit',
        githublink: 'https://github.com/wiwisit',
        linkedinlink: 'https://www.linkedin.com/in/loyce-nantes/',
        profileBanner: 'assets/images/LoyceProfile.png',
        portfolioLink: 'https://loycenantes.wixsite.com/loyce-nantes',
        accordionData: loyceProj,
        achievements: [
          'first achievement',
        ]
    );
    return loyceProf;
  }

  static ProfileModel nathanProfile(){
    List<AccordionModel> nathanProj = AccordionModel.getNathanProj();

    ProfileModel nathanProf = ProfileModel(
        name: 'Nathaniel Abadies',
        about: LoyceAbout(name: 'Loyce Nantes'),
        facebookLink: 'https://www.facebook.com/NathanielAbadiess',
        instagramLink: 'https://www.instagram.com/ur.fav_nathan',
        githublink: 'https://github.com/Under-Maintenance',
        linkedinlink: 'https://www.linkedin.com/in/nathanielabadies/',
        portfolioLink: 'https://www.tancreativecavern.epizy.com/',
        profileBanner: 'assets/images/NatProfile.png',
        accordionData: nathanProj,
        achievements: [
          'first achievement',
        ]
    );
    return nathanProf;
  }

  static ProfileModel zedProfile(){
    List<AccordionModel> zedProj = AccordionModel.getZedProj();

    ProfileModel zedProf = ProfileModel(
        name: 'Zedrick Emmanuel Zafra',
        about: LoyceAbout(name: 'Loyce Nantes'),
        facebookLink: 'https://www.facebook.com/zedrickzafra',
        instagramLink: 'https://www.instagram.com/zebonyy/',
        githublink: 'https://github.com/ZedrickEmmanuel',
        linkedinlink: 'https://www.linkedin.com/in/zedrick-emmanuel-zafra/',
        portfolioLink: 'https://zedrick-zafra.vercel.app/',
        profileBanner: 'assets/images/ZedProfile.png',
        accordionData: zedProj,
        achievements: [
          'first achievement',
        ]
    );
    return zedProf;
  }

  static ProfileModel zekProfile(){
    List<AccordionModel> zekProj = AccordionModel.getZekProj();

    ProfileModel zekProf = ProfileModel(
        name: 'Zedrick Emmanuel Zafra',
        about: LoyceAbout(name: 'Loyce Nantes'),
        facebookLink: 'https://www.facebook.com/profile.php?id=100009430267874',
        instagramLink: 'https://www.instagram.com/zebonyy/',
        githublink: 'https://github.com/ZedrickEmmanuel',
        linkedinlink: 'https://www.linkedin.com/in/zedrick-emmanuel-zafra/',
        portfolioLink: 'https://zedrick-zafra.vercel.app/',
        profileBanner: 'assets/images/ZekProfile.png',
        accordionData: zekProj,
        achievements: [
          'first achievement',
        ]
    );
    return zekProf;
  }

  static List<ProfileModel> allMembers(){
    List<ProfileModel> members = [];

    members.add(loyceProfile());
    members.add(nathanProfile());
    members.add(zedProfile());
    members.add(zekProfile());

    return members;
  }

}