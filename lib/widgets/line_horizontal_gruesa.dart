
import 'package:flutter/material.dart';


class LineaHorizontalGruesa extends CustomPainter {
  late Paint _paint;
  final double strokeWidth;
  final Offset offsetNegativo;
  final Offset offsetPositivo;

  LineaHorizontalGruesa(this.strokeWidth, this.offsetNegativo, this.offsetPositivo, ) {
    _paint = Paint()
      ..color = Colors.black
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(offsetNegativo, offsetPositivo, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
