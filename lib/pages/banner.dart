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
      padding: const EdgeInsets.all(0),
      margin: const EdgeInsets.only(left: 10),
      width: 390,
      height: 310,
      child: Center( // Directly centers the SVG inside the container
        child: SvgPicture.asset(
          'assets/icons/Herobanner.svg',
          height: 275,
          width: 370,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
