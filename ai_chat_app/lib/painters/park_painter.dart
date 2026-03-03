import 'package:flutter/material.dart';

class ParkPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    // 하늘
    final skyPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [const Color(0xFF42A5F5), const Color(0xFF90CAF9)],
      ).createShader(Rect.fromLTWH(0, 0, w, h * 0.45));
    canvas.drawRect(Rect.fromLTWH(0, 0, w, h * 0.45), skyPaint);

    // 태양
    final sunPaint = Paint()..color = const Color(0xFFFFF176);
    canvas.drawCircle(Offset(w * 0.85, h * 0.10), w * 0.06, sunPaint);
    final sunGlow = Paint()
      ..color = const Color(0xFFFFF9C4).withOpacity(0.3);
    canvas.drawCircle(Offset(w * 0.85, h * 0.10), w * 0.10, sunGlow);

    // 구름
    final cloudPaint = Paint()..color = Colors.white.withOpacity(0.9);
    _drawCloud(canvas, w * 0.1, h * 0.06, w * 0.15, cloudPaint);
    _drawCloud(canvas, w * 0.45, h * 0.1, w * 0.12, cloudPaint);
    _drawCloud(canvas, w * 0.7, h * 0.18, w * 0.10, cloudPaint);

    // 잔디 (언덕)
    final grassPaint = Paint()..color = const Color(0xFF4CAF50);
    canvas.drawRect(Rect.fromLTWH(0, h * 0.45, w, h * 0.55), grassPaint);

    // 언덕
    final hillPaint = Paint()..color = const Color(0xFF66BB6A);
    final hillPath = Path()
      ..moveTo(0, h * 0.55)
      ..quadraticBezierTo(w * 0.25, h * 0.40, w * 0.50, h * 0.50)
      ..quadraticBezierTo(w * 0.75, h * 0.60, w, h * 0.48)
      ..lineTo(w, h * 0.55)
      ..close();
    canvas.drawPath(hillPath, hillPaint);

    // 산책로
    final pathPaint = Paint()..color = const Color(0xFFD7CCC8);
    final walkPath = Path()
      ..moveTo(w * 0.0, h * 0.75)
      ..quadraticBezierTo(w * 0.25, h * 0.70, w * 0.50, h * 0.73)
      ..quadraticBezierTo(w * 0.75, h * 0.76, w, h * 0.72);
    final pathStroke = Paint()
      ..color = const Color(0xFFD7CCC8)
      ..style = PaintingStyle.stroke
      ..strokeWidth = h * 0.04;
    canvas.drawPath(walkPath, pathStroke);

    // 산책로 테두리
    final pathBorder = Paint()
      ..color = const Color(0xFFBCAAA4)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    canvas.drawPath(walkPath, pathBorder);

    // 큰 나무들
    _drawLargeTree(canvas, w * 0.08, h * 0.25, w, h);
    _drawLargeTree(canvas, w * 0.75, h * 0.20, w, h);
    _drawPineTree(canvas, w * 0.55, h * 0.28, w, h);

    // 벤치
    _drawBench(canvas, w * 0.30, h * 0.60, w, h);

    // 꽃들
    _drawFlowers(canvas, w * 0.15, h * 0.80, w, h);
    _drawFlowers(canvas, w * 0.60, h * 0.85, w, h);
    _drawFlowers(canvas, w * 0.85, h * 0.78, w, h);

    // 연못
    final pondPaint = Paint()..color = const Color(0xFF4FC3F7).withOpacity(0.7);
    canvas.drawOval(
        Rect.fromLTWH(w * 0.35, h * 0.82, w * 0.20, h * 0.08), pondPaint);
    final pondEdge = Paint()
      ..color = const Color(0xFF29B6F6).withOpacity(0.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.drawOval(
        Rect.fromLTWH(w * 0.35, h * 0.82, w * 0.20, h * 0.08), pondEdge);

    // 오리
    final duckPaint = Paint()..color = const Color(0xFFFFEB3B);
    canvas.drawOval(
        Rect.fromLTWH(w * 0.42, h * 0.84, w * 0.025, h * 0.015), duckPaint);
    final duckHead = Paint()..color = const Color(0xFFFFF176);
    canvas.drawCircle(
        Offset(w * 0.445, h * 0.84), w * 0.008, duckHead);

    // 새
    _drawBird(canvas, w * 0.30, h * 0.08, w);
    _drawBird(canvas, w * 0.35, h * 0.12, w);
    _drawBird(canvas, w * 0.55, h * 0.05, w);
  }

  void _drawCloud(Canvas canvas, double x, double y, double cw, Paint paint) {
    canvas.drawOval(Rect.fromLTWH(x, y, cw * 0.6, cw * 0.3), paint);
    canvas.drawOval(
        Rect.fromLTWH(x + cw * 0.2, y - cw * 0.15, cw * 0.6, cw * 0.4),
        paint);
    canvas.drawOval(
        Rect.fromLTWH(x + cw * 0.45, y, cw * 0.55, cw * 0.3), paint);
  }

  void _drawLargeTree(
      Canvas canvas, double x, double y, double w, double h) {
    // 줄기
    final trunkPaint = Paint()..color = const Color(0xFF5D4037);
    canvas.drawRect(
        Rect.fromLTWH(x + w * 0.03, y + h * 0.15, w * 0.04, h * 0.25),
        trunkPaint);

    // 잎사귀 (여러 겹)
    final leafDark = Paint()..color = const Color(0xFF2E7D32);
    final leafMid = Paint()..color = const Color(0xFF388E3C);
    final leafLight = Paint()..color = const Color(0xFF4CAF50);

    canvas.drawOval(
        Rect.fromLTWH(x - w * 0.02, y + h * 0.02, w * 0.14, h * 0.18),
        leafDark);
    canvas.drawOval(
        Rect.fromLTWH(x, y - h * 0.02, w * 0.10, h * 0.16), leafMid);
    canvas.drawOval(
        Rect.fromLTWH(x + w * 0.01, y + h * 0.01, w * 0.08, h * 0.12),
        leafLight);
  }

  void _drawPineTree(
      Canvas canvas, double x, double y, double w, double h) {
    // 줄기
    final trunkPaint = Paint()..color = const Color(0xFF5D4037);
    canvas.drawRect(
        Rect.fromLTWH(x + w * 0.03, y + h * 0.15, w * 0.03, h * 0.20),
        trunkPaint);

    // 삼각형 잎
    final leafPaint = Paint()..color = const Color(0xFF1B5E20);
    for (int i = 0; i < 3; i++) {
      final ty = y + i * h * 0.06;
      final triPath = Path()
        ..moveTo(x + w * 0.045, ty)
        ..lineTo(x - w * 0.01 + i * w * 0.005, ty + h * 0.10)
        ..lineTo(x + w * 0.10 - i * w * 0.005, ty + h * 0.10)
        ..close();
      canvas.drawPath(triPath, leafPaint);
    }
  }

  void _drawBench(Canvas canvas, double x, double y, double w, double h) {
    final woodPaint = Paint()..color = const Color(0xFF8D6E63);
    final legPaint = Paint()..color = const Color(0xFF5D4037);

    // 좌판
    canvas.drawRect(
        Rect.fromLTWH(x, y, w * 0.12, h * 0.02), woodPaint);
    // 등받이
    canvas.drawRect(
        Rect.fromLTWH(x, y - h * 0.04, w * 0.12, h * 0.015), woodPaint);

    // 다리
    canvas.drawRect(
        Rect.fromLTWH(x + w * 0.01, y + h * 0.02, w * 0.01, h * 0.04),
        legPaint);
    canvas.drawRect(
        Rect.fromLTWH(x + w * 0.10, y + h * 0.02, w * 0.01, h * 0.04),
        legPaint);
  }

  void _drawFlowers(Canvas canvas, double x, double y, double w, double h) {
    final colors = [
      const Color(0xFFE91E63),
      const Color(0xFFFF9800),
      const Color(0xFF9C27B0),
      const Color(0xFFFFEB3B),
    ];
    for (int i = 0; i < 4; i++) {
      final fx = x + i * w * 0.025;
      final fy = y + (i % 2) * h * 0.02;
      // 줄기
      final stemPaint = Paint()
        ..color = const Color(0xFF388E3C)
        ..strokeWidth = 1;
      canvas.drawLine(Offset(fx, fy), Offset(fx, fy + h * 0.03), stemPaint);
      // 꽃
      final flowerPaint = Paint()..color = colors[i];
      canvas.drawCircle(Offset(fx, fy), w * 0.008, flowerPaint);
    }
  }

  void _drawBird(Canvas canvas, double x, double y, double w) {
    final birdPaint = Paint()
      ..color = const Color(0xFF424242)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;
    final birdPath = Path()
      ..moveTo(x, y)
      ..quadraticBezierTo(x + w * 0.01, y - w * 0.01, x + w * 0.02, y)
      ..moveTo(x, y)
      ..quadraticBezierTo(x - w * 0.01, y - w * 0.01, x - w * 0.02, y);
    canvas.drawPath(birdPath, birdPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
