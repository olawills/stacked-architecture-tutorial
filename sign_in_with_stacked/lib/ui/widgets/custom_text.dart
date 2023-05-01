import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String message;
  final TextStyle? style;
  const CustomText({
    super.key,
    required this.message,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      message,
      style: style,
    );
  }
}
