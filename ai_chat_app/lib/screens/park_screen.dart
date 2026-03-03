import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/game_state.dart';
import '../painters/park_painter.dart';
import '../widgets/navigation_arrow.dart';

class ParkScreen extends StatelessWidget {
  const ParkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final gameState = context.read<GameState>();
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        // 배경 씬
        SizedBox.expand(
          child: CustomPaint(painter: ParkPainter()),
        ),
        // 장소 이름
        Positioned(
          top: 16,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                '공원',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        // 왼쪽 화살표 → 도시로
        Positioned(
          left: 16,
          top: size.height * 0.45,
          child: NavigationArrow(
            direction: ArrowDirection.left,
            label: '도시',
            onTap: () => gameState.moveTo(Location.city),
          ),
        ),
      ],
    );
  }
}
