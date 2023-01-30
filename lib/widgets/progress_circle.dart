import 'package:flutter/material.dart';

class ProgressCircle extends StatelessWidget {
  final Color color;
  const ProgressCircle({this.color = Colors.white, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 16,
        width: 16,
        child: CircularProgressIndicator.adaptive(
          backgroundColor: color,
          strokeWidth: 2.0,
        ));
  }
}
