import 'package:common_jds_flutter/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';

class CardsWidgets extends StatelessWidget {
  const CardsWidgets({
    super.key,
    required this.color,
    required this.icon,
    required this.title,
    required this.value,
  });

  final Color color;
  final IconData icon;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      height: 120,
      padding: const EdgeInsets.only(right: 12, left: 12, top: 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 24,
          ),
          const SizedBox(height: 10),
          CustomText(
            text: title,
            color: Colors.white,
            isRilFont: true,
            size: 14,
            fontWeight: CustomFontWeight.bold,
          ),
          CustomText(
            text: value,
            color: Colors.white,
            isRilFont: true,
            size: 30,
            fontWeight: CustomFontWeight.bold,
          ),
        ],
      ),
    );
  }
}
