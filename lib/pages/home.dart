import 'package:flutter/material.dart';


class HomePage extends StatelessWidget{
    const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.white,
      body: Column(children: [
      ]),
    );
}

  AppBar appBar(){
    return AppBar(title: Text('hello world!'));
  }
}