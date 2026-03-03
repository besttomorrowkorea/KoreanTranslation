import 'package:flutter/material.dart';

class BankPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    // 벽
    final wallPaint = Paint()..color = const Color(0xFFF5F0E8);
    canvas.drawRect(Rect.fromLTWH(0, 0, w, h * 0.65), wallPaint);

    // 바닥 (대리석)
    final floorPaint = Paint()..color = const Color(0xFFE0D5C5);
    canvas.drawRect(Rect.fromLTWH(0, h * 0.65, w, h * 0.35), floorPaint);

    // 바닥 타일 패턴
    final tileLine = Paint()
      ..color = const Color(0xFFD5C9B5)
      ..strokeWidth = 1;
    for (double x = 0; x < w; x += w * 0.1) {
      canvas.drawLine(Offset(x, h * 0.65), Offset(x, h), tileLine);
    }
    for (double y = h * 0.65; y < h; y += h * 0.08) {
      canvas.drawLine(Offset(0, y), Offset(w, y), tileLine);
    }

    // 카운터
    final counterPaint = Paint()..color = const Color(0xFF5D4037);
    canvas.drawRect(
        Rect.fromLTWH(w * 0.1, h * 0.45, w * 0.8, h * 0.08), counterPaint);
    // 카운터 앞면
    final counterFront = Paint()..color = const Color(0xFF4E342E);
    canvas.drawRect(
        Rect.fromLTWH(w * 0.1, h * 0.53, w * 0.8, h * 0.12), counterFront);

    // 카운터 유리 칸막이
    final glassPaint = Paint()
      ..color = const Color(0xFF90CAF9).withOpacity(0.3)
      ..style = PaintingStyle.fill;
    canvas.drawRect(
        Rect.fromLTWH(w * 0.15, h * 0.20, w * 0.25, h * 0.25), glassPaint);
    final glassFrame = Paint()
      ..color = const Color(0xFF78909C)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.drawRect(
        Rect.fromLTWH(w * 0.15, h * 0.20, w * 0.25, h * 0.25), glassFrame);

    // 은행 직원 (간단한 캐릭터)
    _drawBanker(canvas, w * 0.27, h * 0.12, w, h);

    // 컴퓨터
    final monitorPaint = Paint()..color = const Color(0xFF37474F);
    canvas.drawRect(
        Rect.fromLTWH(w * 0.60, h * 0.32, w * 0.12, h * 0.10), monitorPaint);
    final screenPaint = Paint()..color = const Color(0xFF4FC3F7);
    canvas.drawRect(
        Rect.fromLTWH(w * 0.61, h * 0.33, w * 0.10, h * 0.08), screenPaint);
    // 모니터 받침
    canvas.drawRect(
        Rect.fromLTWH(w * 0.64, h * 0.42, w * 0.04, h * 0.03), monitorPaint);

    // 서류 더미
    final paperPaint = Paint()..color = Colors.white;
    canvas.drawRect(
        Rect.fromLTWH(w * 0.78, h * 0.40, w * 0.08, h * 0.05), paperPaint);
    final paperLine = Paint()
      ..color = const Color(0xFFBDBDBD)
      ..strokeWidth = 0.5;
    for (double y = h * 0.41; y < h * 0.45; y += h * 0.01) {
      canvas.drawLine(
          Offset(w * 0.79, y), Offset(w * 0.85, y), paperLine);
    }

    // 벽 시계
    final clockBg = Paint()..color = const Color(0xFF5D4037);
    canvas.drawCircle(Offset(w * 0.8, h * 0.10), w * 0.04, clockBg);
    final clockFace = Paint()..color = const Color(0xFFFFF8E1);
    canvas.drawCircle(Offset(w * 0.8, h * 0.10), w * 0.035, clockFace);

    // "은행" 벽 간판
    final signPaint = Paint()..color = const Color(0xFF1565C0);
    canvas.drawRect(
        Rect.fromLTWH(w * 0.35, h * 0.03, w * 0.30, h * 0.06), signPaint);
    final textPainter = TextPainter(
      text: const TextSpan(
        text: '은  행',
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(canvas, Offset(w * 0.44, h * 0.04));

    // 화분
    final potPaint = Paint()..color = const Color(0xFF8D6E63);
    canvas.drawRect(
        Rect.fromLTWH(w * 0.05, h * 0.55, w * 0.06, h * 0.08), potPaint);
    final plantPaint = Paint()..color = const Color(0xFF4CAF50);
    canvas.drawOval(
        Rect.fromLTWH(w * 0.03, h * 0.45, w * 0.10, h * 0.12), plantPaint);
  }

  void _drawBanker(Canvas canvas, double cx, double cy, double w, double h) {
    // 몸통 (셔츠)
    final bodyPaint = Paint()..color = const Color(0xFF1565C0);
    canvas.drawRect(
        Rect.fromLTWH(cx - w * 0.04, cy + h * 0.06, w * 0.08, h * 0.12),
        bodyPaint);

    // 머리
    final headPaint = Paint()..color = const Color(0xFFFFCC80);
    canvas.drawCircle(Offset(cx, cy + h * 0.03), w * 0.035, headPaint);

    // 머리카락
    final hairPaint = Paint()..color = const Color(0xFF3E2723);
    canvas.drawArc(
      Rect.fromLTWH(cx - w * 0.035, cy - h * 0.01, w * 0.07, h * 0.05),
      3.14,
      3.14,
      true,
      hairPaint,
    );

    // 넥타이
    final tiePaint = Paint()..color = const Color(0xFFD32F2F);
    canvas.drawRect(
        Rect.fromLTWH(cx - w * 0.005, cy + h * 0.06, w * 0.01, h * 0.08),
        tiePaint);

    // 눈
    final eyePaint = Paint()..color = const Color(0xFF212121);
    canvas.drawCircle(
        Offset(cx - w * 0.012, cy + h * 0.025), w * 0.005, eyePaint);
    canvas.drawCircle(
        Offset(cx + w * 0.012, cy + h * 0.025), w * 0.005, eyePaint);

    // 미소
    final smilePaint = Paint()
      ..color = const Color(0xFF212121)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    canvas.drawArc(
      Rect.fromLTWH(cx - w * 0.01, cy + h * 0.03, w * 0.02, h * 0.015),
      0,
      3.14,
      false,
      smilePaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
