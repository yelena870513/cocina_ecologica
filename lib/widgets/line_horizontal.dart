
import 'package:cocina_ecologica/constants/colors.dart';
import 'package:flutter/material.dart';


class LineaHorizontal extends CustomPainter {
  late Paint _paint;

  LineaHorizontal() {
    _paint = Paint()
      ..color = AppColors.verdeOscuro
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round;
  }

  @override
  void paint(Canvas canvas, Size size) {
    
    canvas.drawLine(const Offset(-400.0, 0.0), const Offset(300.0, 0.0), _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
