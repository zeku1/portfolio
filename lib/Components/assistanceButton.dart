import 'package:flutter/material.dart';

class AssistanceButton extends StatelessWidget {
  const AssistanceButton({super.key});

  @override
  Widget build(BuildContext context) {
    return _assistanceText();
  }


 Widget _assistanceText() {
    return Container(
      margin: const EdgeInsets.only(right: 95.0, top: 85.0), // Margin from the left and top edges
      child: GestureDetector(
        onTap: () {
          print('Need Assistance text clicked');
        },
        child: Text(
          'Need Assistance?',
          style: TextStyle(
            color: Color(0xff8091F7), // Text color
            fontSize: 22, // Text size
          ),
        ),
      )
    ]);
  }
}
