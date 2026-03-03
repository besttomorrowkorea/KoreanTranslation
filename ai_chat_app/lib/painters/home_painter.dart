import 'package:flutter/material.dart';

class HomePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    // 바닥 (나무 마루)
    final floorPaint = Paint()..color = const Color(0xFF8B6914);
    canvas.drawRect(Rect.fromLTWH(0, h * 0.65, w, h * 0.35), floorPaint);

    // 바닥 나무결 패턴
    final plankLine = Paint()
      ..color = const Color(0xFF7A5C10)
      ..strokeWidth = 1;
    for (double y = h * 0.65; y < h; y += h * 0.05) {
      canvas.drawLine(Offset(0, y), Offset(w, y), plankLine);
    }

    // 벽
    final wallPaint = Paint()..color = const Color(0xFFE8D5B7);
    canvas.drawRect(Rect.fromLTWH(0, 0, w, h * 0.65), wallPaint);

    // 벽 패턴 (벽돌 느낌)
    final wallLine = Paint()
      ..color = const Color(0xFFDCC9A8)
      ..strokeWidth = 0.5;
    for (double y = 0; y < h * 0.65; y += h * 0.04) {
      canvas.drawLine(Offset(0, y), Offset(w, y), wallLine);
    }

    // 창문
    final windowFrame = Paint()..color = const Color(0xFF5D4037);
    canvas.drawRect(
        Rect.fromLTWH(w * 0.35, h * 0.08, w * 0.3, h * 0.25), windowFrame);
    final windowGlass = Paint()..color = const Color(0xFF87CEEB);
    canvas.drawRect(
        Rect.fromLTWH(w * 0.36, h * 0.09, w * 0.13, h * 0.23), windowGlass);
    canvas.drawRect(
        Rect.fromLTWH(w * 0.51, h * 0.09, w * 0.13, h * 0.23), windowGlass);
    // 창문 십자
    final crossPaint = Paint()
      ..color = const Color(0xFF5D4037)
      ..strokeWidth = 3;
    canvas.drawLine(Offset(w * 0.5, h * 0.09), Offset(w * 0.5, h * 0.32),
        crossPaint);
    canvas.drawLine(Offset(w * 0.36, h * 0.2), Offset(w * 0.64, h * 0.2),
        crossPaint);

    // 커튼
    final curtainPaint = Paint()..color = const Color(0xFFE57373);
    canvas.drawRect(
        Rect.fromLTWH(w * 0.30, h * 0.06, w * 0.07, h * 0.28), curtainPaint);
    canvas.drawRect(
        Rect.fromLTWH(w * 0.63, h * 0.06, w * 0.07, h * 0.28), curtainPaint);

    // 소파
    final sofaPaint = Paint()..color = const Color(0xFF6D4C41);
    canvas.drawRect(
        Rect.fromLTWH(w * 0.05, h * 0.45, w * 0.35, h * 0.2), sofaPaint);
    // 소파 등받이
    final sofaBack = Paint()..color = const Color(0xFF5D4037);
    canvas.drawRect(
        Rect.fromLTWH(w * 0.05, h * 0.40, w * 0.35, h * 0.08), sofaBack);
    // 소파 쿠션
    final cushionPaint = Paint()..color = const Color(0xFFFF8A65);
    canvas.drawRect(
        Rect.fromLTWH(w * 0.08, h * 0.42, w * 0.08, h * 0.06), cushionPaint);
    canvas.drawRect(
        Rect.fromLTWH(w * 0.30, h * 0.42, w * 0.08, h * 0.06), cushionPaint);

    // 테이블
    final tablePaint = Paint()..color = const Color(0xFF795548);
    canvas.drawRect(
        Rect.fromLTWH(w * 0.45, h * 0.50, w * 0.20, h * 0.04), tablePaint);
    // 테이블 다리
    canvas.drawRect(
        Rect.fromLTWH(w * 0.47, h * 0.54, w * 0.03, h * 0.12), tablePaint);
    canvas.drawRect(
        Rect.fromLTWH(w * 0.60, h * 0.54, w * 0.03, h * 0.12), tablePaint);

    // 테이블 위 컵
    final cupPaint = Paint()..color = const Color(0xFFFFFFFF);
    canvas.drawRect(
        Rect.fromLTWH(w * 0.52, h * 0.46, w * 0.04, h * 0.04), cupPaint);

    // 책장
    final shelfPaint = Paint()..color = const Color(0xFF4E342E);
    canvas.drawRect(
        Rect.fromLTWH(w * 0.75, h * 0.10, w * 0.20, h * 0.45), shelfPaint);
    // 책장 선반
    final shelfLine = Paint()
      ..color = const Color(0xFF3E2723)
      ..strokeWidth = 2;
    for (double y = h * 0.20; y < h * 0.55; y += h * 0.10) {
      canvas.drawLine(Offset(w * 0.75, y), Offset(w * 0.95, y), shelfLine);
    }
    // 책들
    final bookColors = [
      const Color(0xFFE53935),
      const Color(0xFF1E88E5),
      const Color(0xFF43A047),
      const Color(0xFFFDD835),
      const Color(0xFF8E24AA),
    ];
    for (int row = 0; row < 4; row++) {
      for (int i = 0; i < 5; i++) {
        final bookPaint = Paint()..color = bookColors[i % bookColors.length];
        canvas.drawRect(
          Rect.fromLTWH(
            w * 0.76 + i * w * 0.035,
            h * 0.11 + row * h * 0.10,
            w * 0.03,
            h * 0.08,
          ),
          bookPaint,
        );
      }
    }

    // 카펫
    final carpetPaint = Paint()..color = const Color(0xFFB71C1C).withOpacity(0.6);
    canvas.drawOval(
        Rect.fromLTWH(w * 0.25, h * 0.72, w * 0.5, h * 0.15), carpetPaint);
    final carpetBorder = Paint()
      ..color = const Color(0xFFFFD54F).withOpacity(0.6)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.drawOval(
        Rect.fromLTWH(w * 0.25, h * 0.72, w * 0.5, h * 0.15), carpetBorder);

    // 시계
    final clockPaint = Paint()..color = const Color(0xFF5D4037);
    canvas.drawCircle(Offset(w * 0.15, h * 0.15), w * 0.04, clockPaint);
    final clockFace = Paint()..color = const Color(0xFFFFF8E1);
    canvas.drawCircle(Offset(w * 0.15, h * 0.15), w * 0.035, clockFace);
    final handPaint = Paint()
      ..color = const Color(0xFF3E2723)
      ..strokeWidth = 2;
    canvas.drawLine(
        Offset(w * 0.15, h * 0.15), Offset(w * 0.15, h * 0.12), handPaint);
    canvas.drawLine(
        Offset(w * 0.15, h * 0.15), Offset(w * 0.17, h * 0.15), handPaint);

    // 조명 (천장)
    final lampPaint = Paint()..color = const Color(0xFFFFF176);
    canvas.drawRect(
        Rect.fromLTWH(w * 0.47, 0, w * 0.06, h * 0.05), lampPaint);
    final lampShade = Paint()..color = const Color(0xFFFFEB3B);
    final lampPath = Path()
      ..moveTo(w * 0.44, h * 0.05)
      ..lineTo(w * 0.56, h * 0.05)
      ..lineTo(w * 0.53, h * 0.03)
      ..lineTo(w * 0.47, h * 0.03)
      ..close();
    canvas.drawPath(lampPath, lampShade);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
