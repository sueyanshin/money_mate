import 'package:flutter/material.dart';
import 'package:money_mate/core/theme/app_colors.dart';

class HomePage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceContainer,
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset("assets/images/money-mate.png", width: 38),
            const SizedBox(width: 12),
            Text("Money Mate"),
          ],
        ),
      ),
      body: Column(children: [
        ],
      ),
    );
  }
}
