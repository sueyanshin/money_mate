import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingView extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.green.shade300.withValues(alpha: 0.1),
      highlightColor: Colors.green.shade100,
      child: Row(
        spacing: 10,
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: .circular(20),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Container(
                  height: 12,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: .circular(20),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  height: 8,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: .circular(20),
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: .end,
            children: [
              Container(
                height: 12,
                width: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: .circular(20),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                height: 8,
                width: 30,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: .circular(20),
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ],
      ),
    );
  }
}
