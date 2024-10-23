import 'package:flutter/material.dart';

class CommonButtons extends StatelessWidget {
  const CommonButtons({
    super.key,
    required this.icon,
    required this.onTap,
  });
  final IconData icon;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(color: Colors.grey),
        ),
        child: Icon(icon),
      ),
    );
  }
}
