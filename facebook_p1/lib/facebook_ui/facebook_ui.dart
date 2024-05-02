import 'package:facebook_p1/facebook_ui/widgets/avatar.dart';
import 'package:facebook_p1/facebook_ui/widgets/publicacion_item.dart';
import 'package:facebook_p1/facebook_ui/widgets/quick_actions.dart';
import 'package:facebook_p1/facebook_ui/widgets/stories.dart';
import 'package:facebook_p1/facebook_ui/widgets/what_is_on_your_mind.dart';
import 'package:facebook_p1/icons/custom_icons.dart';
import 'package:facebook_p1/models/publication.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'widgets/circle_button.dart';
import 'package:faker/faker.dart';

class FacebookUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final faker = Faker();
    final publications = <Publication>[];
    final random = faker.randomGenerator;
    final reactionsIndex = random.integer(reactions.values.length - 1);
    const reactionss = reactions.values;
    for (var i = 0; i < 5; i++) {
      final publicacion = Publication(
        user: User(
          avatar: faker.image.image(),
          username: faker.person.name(),
        ),
        title: faker.lorem.sentence(),
        createAt: faker.date.dateTime(),
        imageUrl: faker.image.image(),
        countComents: random.integer(5000),
        countShares: random.integer(5000),
        currenUserReactions: reactionss[reactionsIndex],
      );
      publications.add(
          publicacion); // agregamos en cada iteracion una nueva publicacion a la lista de publicaciones
    }
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
      body: ListView(children: [
        const SizedBox(height: 10),
        const WhaiIsOnYourMind(),
        const SizedBox(height: 30),
        const QuickActions(),
        const SizedBox(height: 30),
        const Stories(),
        const SizedBox(height: 30),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true, // para que tome la altura del padre
          itemBuilder: (_, index) => publicacionItem(
            publication: publications[index],
          ),
          itemCount: publications.length,
        )
      ]),
    );
  }
}
