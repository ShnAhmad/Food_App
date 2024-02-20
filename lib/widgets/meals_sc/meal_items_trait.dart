import 'package:flutter/material.dart';

class MealItemsTrait extends StatelessWidget {
  const MealItemsTrait({super.key, required this.icon, required this.lable});
  final String lable;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(width: 6),
        Text(
          lable,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
