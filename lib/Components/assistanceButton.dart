import 'package:flutter/material.dart';

class AssistanceButton extends StatelessWidget {
  const AssistanceButton({super.key});

  @override
  Widget build(BuildContext context) {
    return _assistanceText();
  }

  Widget _assistanceText() {
    return _assistanceButton();
  }

  Column _assistanceButton() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      GestureDetector(
        onTap: () {
          print('Need Assistance text clicked');
        },
        child: const Text(
          'Need Assistance?',
          style: TextStyle(
            color: Color(0xff8091F7), // Text color
            fontSize: 16, // Optional: adjust the text size
          ),
        ),
      )
    ]);
  }
}
