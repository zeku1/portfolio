import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/accordion_model.dart';
import 'package:portfolio/CustomWidget/AccordionWidget.dart';

class AccordionComponent extends StatefulWidget {
  List<AccordionModel> accordionData;

  AccordionComponent({Key? key, required this.accordionData}) : super(key: key);

  @override
  State<AccordionComponent> createState() => _AccordionComponentState();
}

class _AccordionComponentState extends State<AccordionComponent> {
  @override
  Widget build(BuildContext context){
    return _accordion();
  }

  Container _accordion(){
    return Container(

        child: Column(
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
          Container(
            width: 370,
            // height: 1000,
            child: ListView.separated(
              physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context, index) => SizedBox(height: 1,),

                itemCount: widget.accordionData.length,
                itemBuilder: (context , index) {
                  return AccordionWidget(
                      title: widget.accordionData[index].title,
                      imagePath: widget.accordionData[index].imagePath,
                      description: widget.accordionData[index].description) ;
                },
            ),



          )

        ],
      )
    );
  }
}

