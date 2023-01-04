import 'package:flutter/material.dart';

class ConoPainter extends CustomPainter {
  final Color colorOne;

  ConoPainter({required this.colorOne});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = colorOne
      ..style = PaintingStyle.fill;

    // Dibujamos el cono en el canvas
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    final path = Path();
    path.moveTo(center.dx, center.dy - radius + 100);
    path.lineTo(center.dx - radius - 700, center.dy + radius - 700);
    path.lineTo(center.dx + radius + 400, center.dy + radius + 100);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
