import 'package:flutter/material.dart';

enum ArrowDirection { left, right, up, down }

class NavigationArrow extends StatelessWidget {
  final ArrowDirection direction;
  final String label;
  final VoidCallback onTap;

  const NavigationArrow({
    super.key,
    required this.direction,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    IconData icon;
    switch (direction) {
      case ArrowDirection.left:
        icon = Icons.arrow_back_rounded;
      case ArrowDirection.right:
        icon = Icons.arrow_forward_rounded;
      case ArrowDirection.up:
        icon = Icons.arrow_upward_rounded;
      case ArrowDirection.down:
        icon = Icons.arrow_downward_rounded;
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.white.withOpacity(0.3)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (direction == ArrowDirection.left) ...[
              Icon(icon, color: Colors.white, size: 24),
              const SizedBox(width: 4),
            ],
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
                shadows: [Shadow(blurRadius: 2, color: Colors.black)],
              ),
            ),
            if (direction == ArrowDirection.right) ...[
              const SizedBox(width: 4),
              Icon(icon, color: Colors.white, size: 24),
            ],
            if (direction == ArrowDirection.up) ...[
              const SizedBox(width: 4),
              Icon(icon, color: Colors.white, size: 24),
            ],
            if (direction == ArrowDirection.down) ...[
              const SizedBox(width: 4),
              Icon(icon, color: Colors.white, size: 24),
            ],
          ],
        ),
      ),
    );
  }
}
