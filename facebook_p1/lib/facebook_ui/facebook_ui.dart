import 'package:facebook_p1/icons/custom_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'widgets/circle_button.dart';

class FacebookUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 150,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
        ),
        leading: SvgPicture.asset(
          'assets/logos/facebook.svg',
          colorFilter:
              const ColorFilter.mode(Colors.blueAccent, BlendMode.srcIn),
          width: 150,
        ),
        actions: const [
          circleButton(
            color: Color(0xffBFBFBF),
            icon: CustomIcons.search,
          ),
          SizedBox(width: 12),
          circleButton(
            color: Color(0xffFE7574),
            icon: CustomIcons.bell,
          ),
          SizedBox(width: 12),
          circleButton(
            color: Color(0xff7BBAFF),
            icon: CustomIcons.user_friends,
            showBadge: true,
          ),
          SizedBox(width: 12),
          circleButton(
            color: Color(0xff1C86E4),
            icon: CustomIcons.messenger,
          ),
          SizedBox(width: 12),
        ],
      ),
    );
  }
}
