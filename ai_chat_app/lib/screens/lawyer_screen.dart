import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/game_state.dart';
import '../painters/lawyer_painter.dart';
import '../widgets/chat_interface.dart';
import '../widgets/navigation_arrow.dart';

class LawyerScreen extends StatelessWidget {
  const LawyerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final gameState = context.read<GameState>();

    return Column(
      children: [
        // 상단: 변호사 사무실 씬
        Expanded(
          flex: 4,
          child: Stack(
            children: [
              SizedBox.expand(
                child: CustomPaint(painter: LawyerPainter()),
              ),
              // 나가기 버튼
              Positioned(
                left: 12,
                top: 12,
                child: NavigationArrow(
                  direction: ArrowDirection.left,
                  label: '나가기',
                  onTap: () => gameState.moveTo(Location.city),
                ),
              ),
            ],
          ),
        ),
        // 하단: 채팅 인터페이스
        const Expanded(
          flex: 5,
          child: ChatInterface(
            characterName: '변호사 김법무',
            characterColor: Color(0xFF4E342E),
          ),
        ),
      ],
    );
  }
}
