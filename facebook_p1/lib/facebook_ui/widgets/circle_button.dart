import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// en esta clase se pretende tener un constructor de botones reutlizable y escalable *
class circleButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final bool showBadge;

  const circleButton({
    super.key,
    required this.color,
    required this.icon,
    this.showBadge = false,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 16,
            ),
          ),
          if (showBadge)
            Positioned(
              top: -3,
              right: 0,
              child: Container(
                width: 13,
                height: 13,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                  border: Border.all(
                    width: 3,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
