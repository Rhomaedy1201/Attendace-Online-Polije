import 'package:flutter/material.dart';

class Gap extends StatelessWidget {
  final double? X;
  final double? Y;
  const Gap({super.key, this.X, this.Y});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: Y ?? 0, width: X ?? 0);
  }
}