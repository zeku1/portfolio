import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AccordionWidget extends StatefulWidget {
  final String title;
  final String imagePath;
  final String description;

  const AccordionWidget({
    Key? key,
    required this.title,
    required this.imagePath,
    required this.description,
  }) : super(key: key);

  @override
  _AccordionWidgetState createState() => _AccordionWidgetState();
}

class _AccordionWidgetState extends State<AccordionWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return _accordionWidget();
  }

  Container _accordionWidget() {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Accordion header (ListTile)
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              widget.title,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize:21,
                ),
              ),
            ),

            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
          ),

          // Content shown when expanded
          if (isExpanded)
            Center(
              child: Container(
                width: 400,
                height: 504,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    stops: [0.0, 0.2884, 0.7466, 0.8975, 0.9741],
                    colors: [
                      Color(0xFFBF82FF),
                      Color(0xFF8372FC),
                      Color(0xFF6A75FB),
                      Color(0xFFB9B3D2),
                      Color(0xFF8BE2D7),
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(50),
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 35),
                  child: Column(
                    children: [
                      Container(
                        child:Image.asset(
                          widget.imagePath,
                          height: 207,
                          width: 363,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        child: Text(
                          widget.description,
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      )
                    ],
                  ),
                )
              ),
            )
          else
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(

                  width: 270, // Adjust the width of the gradient line
                  height: 3, // Adjust the height (thickness) of the line
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xff85ADEB), // Start color of the gradient
                        Color(0xff8BE2DB), // End color of the gradient
                      ],
                    ),
                  ),
                ),
              ]
            )
        ],
      ),
    );
  }
}
