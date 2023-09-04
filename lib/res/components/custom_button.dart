import 'package:flutter/material.dart';
import 'package:quotes_app/res/constants/app_colors.dart';

class CustomButton extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final String text;
  final Color textColor;
  final VoidCallback onTap;
  const CustomButton({
    super.key,
    this.width = double.infinity,
    this.height = 50.0,
    this.color = AppColors.blackColor,
    this.textColor = Colors.white,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          // gradient: AppColors.gradientColors,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}
