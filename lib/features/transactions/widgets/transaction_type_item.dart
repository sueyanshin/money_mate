import 'package:flutter/material.dart';

class TransactionTypeItem extends StatelessWidget {
  const new({
    super.key,
    required this.title,
    required this.icon,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.onTap,
  });
  final String title;
  final IconData icon;
  final Color backgroundColor;
  final Color foregroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: .circular(20),
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 400),

        padding: .symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: .circular(20),
          color: backgroundColor,
        ),
        child: Row(
          spacing: 10,
          mainAxisAlignment: .center,
          crossAxisAlignment: .center,
          children: [
            Icon(icon, color: foregroundColor),
            Text(title, style: TextStyle(color: foregroundColor)),
          ],
        ),
      ),
    );
  }
}
