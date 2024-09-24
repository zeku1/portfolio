import 'package:flutter/material.dart';

class AccordionModel {
  String title;
  String imagePath;
  String description;

  AccordionModel({
    required this.title,
    required this.imagePath,
    required this.description,
  });

  static List<AccordionModel> genData(){
    List<AccordionModel> generalData = [];
    
    generalData.add(AccordionModel(
        title: 'Web Development',
        imagePath: 'assets/images/webdev.png',
        description: 'Let’s build you a killer website that’s not just sleek but also super functional. Whether it’s for your business, blog, or online store—we got you covered.'));
    generalData.add(AccordionModel(
        title: 'Mobile App Development',
        imagePath: 'assets/images/appdev.png',
        description: 'Have an app idea? We’ll turn it into a smooth, user-friendly mobile experience. iOS, Android, or both—we bring it to life.'));
    generalData.add(AccordionModel(
        title: 'Testing and Quality Assurance',
        imagePath: 'assets/images/testing.png',
        description: 'Nobody likes buggy software, right? We’ll test your app inside-out, making sure everything runs like a dream before it hits the real world.'));
    generalData.add(AccordionModel(
        title: 'API Development',
        imagePath: 'assets/images/api.png',
        description: 'Need your app to talk to other platforms? We’ll build or integrate APIs so everything works seamlessly together, no hiccups.'));
    generalData.add(AccordionModel(
        title: 'Project Planning and Management',
        imagePath: 'assets/images/projplan.png',
        description: 'Got a project idea but don’t know where to start? We’ll help you plan, manage, and make sure everything’s on track—easy peasy.'));
    generalData.add(AccordionModel(
        title: 'Research and Development',
        imagePath: 'assets/images/research.png',
        description: 'Always innovating! We’ll research the latest tech to find the best solutions, or develop prototypes to test out your next big idea.'));
    generalData.add(AccordionModel(
        title: 'UX/UI Design',
        imagePath: 'assets/images/uiux.png',
        description: 'Design isn’t just about looking good; it’s about feeling good. We create user experiences that are easy, intuitive, and straight-up enjoyable.'));
    generalData.add(AccordionModel(
        title: 'Maintenance & Support',
        imagePath: 'assets/images/maintenance.png',
        description: 'We won’t just launch your project and disappear. Count on us for ongoing maintenance and updates, so everything stays fresh.'));
    generalData.add(AccordionModel(
        title: 'Database Design & Management',
        imagePath: 'assets/images/database.png',
        description: 'We’ll set up a strong, secure database that keeps your data organized, fast, and ready for action whenever you need it.'));

    return generalData;
  }

  static List<AccordionModel> getloyceProj(){
    List<AccordionModel> loyceProj = [];

    loyceProj.add(AccordionModel(
        title: 'Tourism Malaysia',
        imagePath: 'assets/images/tourismMalaysia.png',
        description: 'As the lead supervisor and project manager, I ensured my team of developers and designers consistently hit the mark and matched the client’s vision perfectly'));
    loyceProj.add(AccordionModel(
        title: 'TiPM',
        imagePath: 'assets/images/TiPM.png',
        description: 'Malaysia’s go-to for tech innovation, needed a fresh look, and I was all in. My work is currently in development, with my team of developers and engineers bringing it to life.'));
    loyceProj.add(AccordionModel(
        title: 'The Greater Kedah',
        imagePath: 'assets/images/TiPM.png',
        description: 'Kedah is gearing up for some serious innovation and I’ve been working directly with the city’s mayor. They’ve loved the concept so far, and we’re set to move into development.'));

    return loyceProj;
  }

  static List<AccordionModel> getNathanProj(){
    List<AccordionModel> nathanProj = [];

    nathanProj.add(AccordionModel(
        title: 'Bean Rose Cafe',
        imagePath: 'assets/images/Placeholder.png',
        description: 'This project contains multiple deliverables, including WordPress, Elementor, InfinityFree for web hosting, and different plugins to enhance the experience.'));

    return nathanProj;
  }

  static List<AccordionModel> getZedProj(){
    List<AccordionModel> zedProj = [];

    zedProj.add(AccordionModel(
        title: 'Merry meals',
        imagePath: 'assets/images/Placeholder.png',
        description: 'As the lead Front-end developer, I ensured the user interfaces are intuitive, user-friendly, and aligned with best practices in design.'));

    return zedProj;
  }

  static List<AccordionModel> getZekProj(){
    List<AccordionModel> zekProj = [];

    zekProj.add(AccordionModel(title: 'title', imagePath: 'imagePath', description: 'description'));

    return zekProj;
  }



}