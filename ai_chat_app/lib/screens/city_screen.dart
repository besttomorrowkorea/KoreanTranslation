import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/game_state.dart';
import '../painters/city_painter.dart';
import '../widgets/navigation_arrow.dart';
import '../widgets/location_button.dart';

class CityScreen extends StatelessWidget {
  const CityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final gameState = context.read<GameState>();
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        // 배경 씬
        SizedBox.expand(
          child: CustomPaint(painter: CityPainter()),
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
                '도시',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        // 왼쪽 화살표 → 집으로
        Positioned(
          left: 16,
          top: size.height * 0.45,
          child: NavigationArrow(
            direction: ArrowDirection.left,
            label: '집',
            onTap: () => gameState.moveTo(Location.home),
          ),
        ),
        // 오른쪽 화살표 → 공원으로
        Positioned(
          right: 16,
          top: size.height * 0.45,
          child: NavigationArrow(
            direction: ArrowDirection.right,
            label: '공원',
            onTap: () => gameState.moveTo(Location.park),
          ),
        ),
        // 은행 입장 버튼
        LocationButton(
          label: '들어가기',
          onTap: () => gameState.moveTo(Location.bank),
          left: size.width * 0.15,
          top: size.height * 0.25,
          width: size.width * 0.30,
          height: size.height * 0.40,
        ),
        // 변호사 사무실 입장 버튼
        LocationButton(
          label: '들어가기',
          onTap: () => gameState.moveTo(Location.lawyer),
          left: size.width * 0.55,
          top: size.height * 0.25,
          width: size.width * 0.30,
          height: size.height * 0.40,
        ),
      ],
    );
  }
}
