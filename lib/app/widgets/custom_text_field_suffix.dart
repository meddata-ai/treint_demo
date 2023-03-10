import 'package:flutter/material.dart';

class CustomTextFieldIconWidget extends StatelessWidget {
  const CustomTextFieldIconWidget({
    Key? key,
    this.onPressed,
    required this.icon,
  }) : super(key: key);

  final Widget icon;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      icon: icon,
    );
  }
}
