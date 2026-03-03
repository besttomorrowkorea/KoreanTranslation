import 'package:flutter/material.dart';

class CityPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    // 하늘
    final skyPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [const Color(0xFF64B5F6), const Color(0xFFBBDEFB)],
      ).createShader(Rect.fromLTWH(0, 0, w, h * 0.5));
    canvas.drawRect(Rect.fromLTWH(0, 0, w, h * 0.5), skyPaint);

    // 구름
    final cloudPaint = Paint()..color = Colors.white.withOpacity(0.9);
    canvas.drawOval(
        Rect.fromLTWH(w * 0.1, h * 0.05, w * 0.12, h * 0.04), cloudPaint);
    canvas.drawOval(
        Rect.fromLTWH(w * 0.15, h * 0.03, w * 0.12, h * 0.05), cloudPaint);
    canvas.drawOval(
        Rect.fromLTWH(w * 0.6, h * 0.08, w * 0.15, h * 0.04), cloudPaint);
    canvas.drawOval(
        Rect.fromLTWH(w * 0.65, h * 0.06, w * 0.12, h * 0.05), cloudPaint);

    // 도로
    final roadPaint = Paint()..color = const Color(0xFF757575);
    canvas.drawRect(Rect.fromLTWH(0, h * 0.7, w, h * 0.3), roadPaint);

    // 인도
    final sidewalkPaint = Paint()..color = const Color(0xFFBDBDBD);
    canvas.drawRect(Rect.fromLTWH(0, h * 0.65, w, h * 0.08), sidewalkPaint);

    // 도로 중앙선
    final linePaint = Paint()
      ..color = const Color(0xFFFFF176)
      ..strokeWidth = 2;
    for (double x = 0; x < w; x += w * 0.08) {
      canvas.drawLine(
          Offset(x, h * 0.83), Offset(x + w * 0.04, h * 0.83), linePaint);
    }

    // 배경 건물들
    final bgBuilding1 = Paint()..color = const Color(0xFF90A4AE);
    canvas.drawRect(
        Rect.fromLTWH(w * 0.0, h * 0.15, w * 0.15, h * 0.50), bgBuilding1);
    final bgBuilding2 = Paint()..color = const Color(0xFF78909C);
    canvas.drawRect(
        Rect.fromLTWH(w * 0.85, h * 0.20, w * 0.15, h * 0.45), bgBuilding2);

    // 은행 건물
    _drawBank(canvas, w, h);

    // 변호사 사무실 건물
    _drawLawOffice(canvas, w, h);

    // 나무
    _drawTree(canvas, w * 0.02, h * 0.45, w * 0.06, h * 0.20);
    _drawTree(canvas, w * 0.92, h * 0.45, w * 0.06, h * 0.20);

    // 가로등
    _drawStreetLamp(canvas, w * 0.48, h * 0.35, w, h);
  }

  void _drawBank(Canvas canvas, double w, double h) {
    // 건물 본체
    final buildingPaint = Paint()..color = const Color(0xFFE0E0E0);
    canvas.drawRect(
        Rect.fromLTWH(w * 0.15, h * 0.25, w * 0.30, h * 0.40), buildingPaint);

    // 지붕
    final roofPaint = Paint()..color = const Color(0xFF455A64);
    final roofPath = Path()
      ..moveTo(w * 0.12, h * 0.25)
      ..lineTo(w * 0.30, h * 0.15)
      ..lineTo(w * 0.48, h * 0.25)
      ..close();
    canvas.drawPath(roofPath, roofPaint);

    // 기둥
    final pillarPaint = Paint()..color = const Color(0xFFBDBDBD);
    canvas.drawRect(
        Rect.fromLTWH(w * 0.17, h * 0.30, w * 0.03, h * 0.35), pillarPaint);
    canvas.drawRect(
        Rect.fromLTWH(w * 0.40, h * 0.30, w * 0.03, h * 0.35), pillarPaint);

    // 문
    final doorPaint = Paint()..color = const Color(0xFF5D4037);
    canvas.drawRect(
        Rect.fromLTWH(w * 0.26, h * 0.48, w * 0.08, h * 0.17), doorPaint);

    // 창문
    final windowPaint = Paint()..color = const Color(0xFF81D4FA);
    canvas.drawRect(
        Rect.fromLTWH(w * 0.20, h * 0.30, w * 0.06, h * 0.06), windowPaint);
    canvas.drawRect(
        Rect.fromLTWH(w * 0.34, h * 0.30, w * 0.06, h * 0.06), windowPaint);
    canvas.drawRect(
        Rect.fromLTWH(w * 0.20, h * 0.40, w * 0.06, h * 0.06), windowPaint);
    canvas.drawRect(
        Rect.fromLTWH(w * 0.34, h * 0.40, w * 0.06, h * 0.06), windowPaint);

    // 은행 간판
    final signPaint = Paint()..color = const Color(0xFF1565C0);
    canvas.drawRect(
        Rect.fromLTWH(w * 0.20, h * 0.20, w * 0.20, h * 0.05), signPaint);

    // "은행" 텍스트
    final textPainter = TextPainter(
      text: const TextSpan(
        text: '은행',
        style: TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(
        canvas, Offset(w * 0.27, h * 0.205));
  }

  void _drawLawOffice(Canvas canvas, double w, double h) {
    // 건물 본체
    final buildingPaint = Paint()..color = const Color(0xFFD7CCC8);
    canvas.drawRect(
        Rect.fromLTWH(w * 0.55, h * 0.28, w * 0.30, h * 0.37), buildingPaint);

    // 지붕
    final roofPaint = Paint()..color = const Color(0xFF5D4037);
    canvas.drawRect(
        Rect.fromLTWH(w * 0.53, h * 0.25, w * 0.34, h * 0.05), roofPaint);

    // 문
    final doorPaint = Paint()..color = const Color(0xFF3E2723);
    canvas.drawRect(
        Rect.fromLTWH(w * 0.66, h * 0.48, w * 0.08, h * 0.17), doorPaint);

    // 창문
    final windowPaint = Paint()..color = const Color(0xFFFFE0B2);
    canvas.drawRect(
        Rect.fromLTWH(w * 0.58, h * 0.32, w * 0.06, h * 0.06), windowPaint);
    canvas.drawRect(
        Rect.fromLTWH(w * 0.76, h * 0.32, w * 0.06, h * 0.06), windowPaint);
    canvas.drawRect(
        Rect.fromLTWH(w * 0.58, h * 0.42, w * 0.06, h * 0.06), windowPaint);
    canvas.drawRect(
        Rect.fromLTWH(w * 0.76, h * 0.42, w * 0.06, h * 0.06), windowPaint);

    // 변호사 간판
    final signPaint = Paint()..color = const Color(0xFF4E342E);
    canvas.drawRect(
        Rect.fromLTWH(w * 0.58, h * 0.26, w * 0.24, h * 0.05), signPaint);

    // "변호사 사무실" 텍스트
    final textPainter = TextPainter(
      text: const TextSpan(
        text: '변호사 사무실',
        style: TextStyle(
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(
        canvas, Offset(w * 0.60, h * 0.265));
  }

  void _drawTree(
      Canvas canvas, double x, double y, double tw, double th) {
    // 줄기
    final trunkPaint = Paint()..color = const Color(0xFF5D4037);
    canvas.drawRect(
        Rect.fromLTWH(x + tw * 0.35, y + th * 0.5, tw * 0.3, th * 0.5),
        trunkPaint);
    // 잎
    final leafPaint = Paint()..color = const Color(0xFF388E3C);
    canvas.drawOval(Rect.fromLTWH(x, y, tw, th * 0.6), leafPaint);
    final leafLight = Paint()..color = const Color(0xFF4CAF50);
    canvas.drawOval(
        Rect.fromLTWH(x + tw * 0.1, y + th * 0.05, tw * 0.6, th * 0.4),
        leafLight);
  }

  void _drawStreetLamp(Canvas canvas, double x, double y, double w, double h) {
    final polePaint = Paint()..color = const Color(0xFF424242);
    canvas.drawRect(Rect.fromLTWH(x, y, w * 0.01, h * 0.30), polePaint);
    final lampPaint = Paint()..color = const Color(0xFFFFF176);
    canvas.drawOval(
        Rect.fromLTWH(x - w * 0.02, y - h * 0.02, w * 0.05, h * 0.03),
        lampPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
