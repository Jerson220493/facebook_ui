import 'package:facebook_p1/facebook_ui/widgets/avatar.dart';
import 'package:flutter/material.dart';

class WhaiIsOnYourMind extends StatelessWidget {
  const WhaiIsOnYourMind({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Avatar(
            size: 50,
            asset: 'assets/users/1.jpg',
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            "What's on your mint ? Jerson",
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
