import 'package:flutter/material.dart';

class LawyerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    // 벽 (어두운 우드톤)
    final wallPaint = Paint()..color = const Color(0xFF5D4037);
    canvas.drawRect(Rect.fromLTWH(0, 0, w, h * 0.65), wallPaint);

    // 벽 패널 패턴
    final panelPaint = Paint()..color = const Color(0xFF6D4C41);
    for (double x = 0; x < w; x += w * 0.25) {
      canvas.drawRect(
          Rect.fromLTWH(x + w * 0.02, h * 0.02, w * 0.21, h * 0.61),
          panelPaint);
    }

    // 바닥 (카펫)
    final floorPaint = Paint()..color = const Color(0xFF4A148C).withOpacity(0.3);
    final floorBase = Paint()..color = const Color(0xFF3E2723);
    canvas.drawRect(Rect.fromLTWH(0, h * 0.65, w, h * 0.35), floorBase);
    canvas.drawRect(Rect.fromLTWH(0, h * 0.65, w, h * 0.35), floorPaint);

    // 대형 책장 (왼쪽)
    _drawBookshelf(canvas, w * 0.02, h * 0.05, w * 0.22, h * 0.55);

    // 대형 책장 (오른쪽)
    _drawBookshelf(canvas, w * 0.76, h * 0.05, w * 0.22, h * 0.55);

    // 책상
    final deskPaint = Paint()..color = const Color(0xFF3E2723);
    canvas.drawRect(
        Rect.fromLTWH(w * 0.25, h * 0.45, w * 0.50, h * 0.06), deskPaint);
    // 책상 앞면
    final deskFront = Paint()..color = const Color(0xFF33201A);
    canvas.drawRect(
        Rect.fromLTWH(w * 0.25, h * 0.51, w * 0.50, h * 0.14), deskFront);
    // 책상 서랍
    final drawerPaint = Paint()
      ..color = const Color(0xFF4E342E)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    canvas.drawRect(
        Rect.fromLTWH(w * 0.28, h * 0.53, w * 0.15, h * 0.05), drawerPaint);
    canvas.drawRect(
        Rect.fromLTWH(w * 0.28, h * 0.59, w * 0.15, h * 0.05), drawerPaint);
    canvas.drawRect(
        Rect.fromLTWH(w * 0.57, h * 0.53, w * 0.15, h * 0.05), drawerPaint);
    canvas.drawRect(
        Rect.fromLTWH(w * 0.57, h * 0.59, w * 0.15, h * 0.05), drawerPaint);

    // 변호사 캐릭터
    _drawLawyer(canvas, w * 0.50, h * 0.15, w, h);

    // 책상 위 물건들
    // 램프
    final lampBasePaint = Paint()..color = const Color(0xFFFFD54F);
    canvas.drawRect(
        Rect.fromLTWH(w * 0.30, h * 0.41, w * 0.04, h * 0.04), lampBasePaint);
    final lampShadePaint = Paint()..color = const Color(0xFF43A047);
    canvas.drawRect(
        Rect.fromLTWH(w * 0.28, h * 0.37, w * 0.08, h * 0.04), lampShadePaint);

    // 책 더미
    final bookColors = [
      const Color(0xFF8D6E63),
      const Color(0xFFC62828),
      const Color(0xFF1B5E20),
    ];
    for (int i = 0; i < 3; i++) {
      final bookPaint = Paint()..color = bookColors[i];
      canvas.drawRect(
        Rect.fromLTWH(
            w * 0.62, h * 0.41 - i * h * 0.02, w * 0.08, h * 0.018),
        bookPaint,
      );
    }

    // 서류
    final paperPaint = Paint()..color = Colors.white;
    canvas.drawRect(
        Rect.fromLTWH(w * 0.42, h * 0.41, w * 0.06, h * 0.04), paperPaint);

    // 펜꽂이
    final penHolderPaint = Paint()..color = const Color(0xFF212121);
    canvas.drawRect(
        Rect.fromLTWH(w * 0.50, h * 0.41, w * 0.03, h * 0.04),
        penHolderPaint);

    // 벽 액자
    final framePaint = Paint()..color = const Color(0xFFFFD54F);
    canvas.drawRect(
        Rect.fromLTWH(w * 0.40, h * 0.05, w * 0.20, h * 0.15), framePaint);
    final frameInner = Paint()..color = const Color(0xFFE8D5B7);
    canvas.drawRect(
        Rect.fromLTWH(w * 0.41, h * 0.06, w * 0.18, h * 0.13), frameInner);

    // "법무법인" 간판
    final signPaint = Paint()..color = const Color(0xFF4E342E);
    canvas.drawRect(
        Rect.fromLTWH(w * 0.30, h * 0.0, w * 0.40, h * 0.04), signPaint);
    final textPainter = TextPainter(
      text: const TextSpan(
        text: '법무법인 김법무',
        style: TextStyle(
          color: Color(0xFFFFD54F),
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(canvas, Offset(w * 0.36, h * 0.008));
  }

  void _drawBookshelf(
      Canvas canvas, double x, double y, double bw, double bh) {
    final shelfPaint = Paint()..color = const Color(0xFF4E342E);
    canvas.drawRect(Rect.fromLTWH(x, y, bw, bh), shelfPaint);

    // 선반
    final shelfLine = Paint()
      ..color = const Color(0xFF3E2723)
      ..strokeWidth = 2;
    final rows = 5;
    for (int i = 1; i <= rows; i++) {
      final sy = y + (bh / rows) * i;
      canvas.drawLine(Offset(x, sy), Offset(x + bw, sy), shelfLine);
    }

    // 책
    final bookColors = [
      const Color(0xFFC62828),
      const Color(0xFF1565C0),
      const Color(0xFF2E7D32),
      const Color(0xFFF9A825),
      const Color(0xFF6A1B9A),
      const Color(0xFFD84315),
    ];
    for (int row = 0; row < rows; row++) {
      for (int i = 0; i < 5; i++) {
        final bookPaint = Paint()
          ..color = bookColors[(row * 5 + i) % bookColors.length];
        canvas.drawRect(
          Rect.fromLTWH(
            x + bw * 0.05 + i * bw * 0.18,
            y + (bh / rows) * row + bh * 0.01,
            bw * 0.15,
            bh / rows - bh * 0.02,
          ),
          bookPaint,
        );
      }
    }
  }

  void _drawLawyer(Canvas canvas, double cx, double cy, double w, double h) {
    // 의자
    final chairPaint = Paint()..color = const Color(0xFF212121);
    canvas.drawRect(
        Rect.fromLTWH(cx - w * 0.06, cy + h * 0.18, w * 0.12, h * 0.15),
        chairPaint);
    // 의자 등받이
    canvas.drawRect(
        Rect.fromLTWH(cx - w * 0.05, cy + h * 0.10, w * 0.10, h * 0.10),
        chairPaint);

    // 몸통 (정장)
    final bodyPaint = Paint()..color = const Color(0xFF212121);
    canvas.drawRect(
        Rect.fromLTWH(cx - w * 0.04, cy + h * 0.08, w * 0.08, h * 0.14),
        bodyPaint);

    // 셔츠
    final shirtPaint = Paint()..color = Colors.white;
    canvas.drawRect(
        Rect.fromLTWH(cx - w * 0.015, cy + h * 0.08, w * 0.03, h * 0.06),
        shirtPaint);

    // 머리
    final headPaint = Paint()..color = const Color(0xFFFFCC80);
    canvas.drawCircle(Offset(cx, cy + h * 0.045), w * 0.035, headPaint);

    // 머리카락
    final hairPaint = Paint()..color = const Color(0xFF424242);
    canvas.drawArc(
      Rect.fromLTWH(cx - w * 0.038, cy + h * 0.005, w * 0.076, h * 0.04),
      3.14,
      3.14,
      true,
      hairPaint,
    );

    // 안경
    final glassesPaint = Paint()
      ..color = const Color(0xFF212121)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;
    canvas.drawCircle(
        Offset(cx - w * 0.015, cy + h * 0.04), w * 0.012, glassesPaint);
    canvas.drawCircle(
        Offset(cx + w * 0.015, cy + h * 0.04), w * 0.012, glassesPaint);
    canvas.drawLine(Offset(cx - w * 0.003, cy + h * 0.04),
        Offset(cx + w * 0.003, cy + h * 0.04), glassesPaint);

    // 눈
    final eyePaint = Paint()..color = const Color(0xFF212121);
    canvas.drawCircle(
        Offset(cx - w * 0.015, cy + h * 0.04), w * 0.004, eyePaint);
    canvas.drawCircle(
        Offset(cx + w * 0.015, cy + h * 0.04), w * 0.004, eyePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
