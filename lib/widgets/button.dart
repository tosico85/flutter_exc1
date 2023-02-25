import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String btnText;
  final Color bgColor;
  final Color textColor;

  const Button({
    super.key,
    required this.btnText,
    required this.bgColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(45),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 40,
        ),
        child: Text(
          btnText,
          style: TextStyle(
            color: textColor,
          ),
        ),
      ),
    );
  }
}
