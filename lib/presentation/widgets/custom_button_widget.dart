import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? fontColor;

  const CustomButtonWidget({
    Key? key,
    required this.label,
    required this.onPressed,
    this.backgroundColor = Colors.green,
    this.fontColor = Colors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: backgroundColor,
        padding: const EdgeInsets.only(
          top: 8,
          right: 8,
          bottom: 8,
          left: 8,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
        ),
      ),
      child: Text(
        label,
      ),
    );
  }
}
