import 'package:flutter/material.dart';

import '../colors.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final double width;
  final double height;

  const PrimaryButton({
    Key? key,
    this.label = "Label",
    this.onPressed,
    this.width = double.maxFinite,
    this.height = 50,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            fixedSize: Size(width, height),
            backgroundColor: JobBoardColors.primaryColor),
        child: Text(label,
            style: TextStyle(
              color: JobBoardColors.white,
              fontSize: 15,
              letterSpacing: 0.5,
              fontWeight: FontWeight.w600,
            )),
      ),
    );
  }
}