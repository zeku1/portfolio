import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeroBanner extends StatelessWidget {
  const HeroBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return _heroBanner();
  }

  Container _heroBanner() {
    return Container(

      padding: EdgeInsets.all(0),
      margin: EdgeInsets.only(left: 5,top:24),
      width: 380,
      height: 300,
      child:Center(
        child: Stack(
          children: [ // Directly centers the SVG inside the container
             SvgPicture.asset(
              'assets/icons/Herobanner.svg',
              height: 275,
              width: 370,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 0.0,
              right: 0.0,
              child: GestureDetector(
                onTap: (){},
                child: SvgPicture.asset('assets/icons/ScrollDownButton.svg',
                height: 60,
                width: 60,
                ),
              ),
            )
          ],
        ),
      )
    );
  }

}
