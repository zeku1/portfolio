import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; 

class AssistanceButton extends StatelessWidget {
  const AssistanceButton({super.key});

  @override
  Widget build(BuildContext context) {
    return _assistanceText();
  }

  Widget _assistanceText() {
    return GestureDetector(
      onTap: () {
        print('Need Assistance text clicked');
      },
      child: Text(
        'Need Assistance?',
        style: TextStyle(
          color: Colors.purple, // Text color
          fontSize: 16, // Optional: adjust the text size
        ),
      ),
    );
  }
}