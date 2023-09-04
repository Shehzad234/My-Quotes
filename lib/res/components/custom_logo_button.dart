import 'package:flutter/material.dart';
import 'package:quotes_app/res/constants/app_colors.dart';

class CustomLogoButton extends StatelessWidget {
  final String url;
  final String text;
  final bool isFacebook;
  const CustomLogoButton({
    Key? key,
    required this.url,
    required this.text,
    this.isFacebook = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        height: 60,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          border: Border.all(color: AppColors.greyColor, width: 0.5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              url,
              height: 38,
            ),
            const SizedBox(width: 8),
            Text(
              text,
              style: TextStyle(
                color: isFacebook ? Colors.blue : Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
