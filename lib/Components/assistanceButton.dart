import 'package:flutter/material.dart';
import 'package:portfolio/Theme/theme.dart';

class AssistanceButton extends StatelessWidget {
  const AssistanceButton({super.key});

  @override
  Widget build(BuildContext context) {
    return _assistanceText(context);
  }

  Widget _assistanceText(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 95.0, top: 85.0), // Margin from the left and top edges
      child: GestureDetector(
        onTap: () {
          print('Need Assistance text clicked');
        },
        child: Text(
          'Need Assistance?',
          style: CustomTheme.getTextStyle(context), // Apply the dynamic text style
        ),
      ),
    );
  }
}