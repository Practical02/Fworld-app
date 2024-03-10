import 'package:flutter/material.dart';
import 'package:function_world_app/core/app_colors.dart';

class NavBarItem extends StatelessWidget {
  final Function()? onTap;
  final String imageURL;
  final String label;
  final String selected;
  const NavBarItem(
      {super.key,
      required this.imageURL,
      required this.label,
      required this.selected,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: label == selected
                    ? AppColors.buttonColorTransparent
                    : Colors.transparent),
            child: Image(
              image: AssetImage(imageURL),
              width: 24,
              color: AppColors.primaryColor,
            ),
          ),
          Text(
            label,
            style: const TextStyle(
                color: AppColors.primaryColor,
                fontFamily: 'Gilroy',
                fontSize: 14,
                fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
