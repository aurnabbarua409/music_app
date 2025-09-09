import 'package:flutter/material.dart';

class CustomPaintButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomPaintButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: CustomPaint(
        painter: _ButtonPainter(),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
          alignment: Alignment.center,
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class _ButtonPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double radius = 12;
    final double strokeWidth = 1.5;

    // Background paint (slightly dark)
    final Paint backgroundPaint = Paint()
      ..color = Colors.grey.shade800
      ..style = PaintingStyle.fill;

    // Border paint
    final Paint borderPaint = Paint()
      ..color = Colors.white.withOpacity(0.6)
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    // Draw background
    final RRect rRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Radius.circular(radius),
    );
    canvas.drawRRect(rRect, backgroundPaint);

    // Draw border
    canvas.drawRRect(rRect, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
