import 'package:facebook_p1/facebook_ui/widgets/avatar.dart';
import 'package:facebook_p1/models/publication.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';

class publicacionItem extends StatelessWidget {
  const publicacionItem({super.key, required this.publication});
  final Publication publication;
  @override
  Widget build(BuildContext context) {
    const padd = EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 10,
    );

    String _getEmojiPath(reactions reac) {
      switch (reac) {
        case reactions.like:
          return 'assets/emojis/like.svg';
        case reactions.love:
          return 'assets/emojis/heart.svg';
        case reactions.laughing:
          return 'assets/emojis/laughing.svg';
        case reactions.sad:
          return 'assets/emojis/sad.svg';
        case reactions.shocking:
          return 'assets/emojis/shocked.svg';
        case reactions.angry:
          return 'assets/emojis/angry.svg';
      }
    }

    const reactionss = reactions.values;

    String _getFormatCount(int value) {
      if (value <= 1000) {
        return value.toString();
      } else {
        return "${(value / 1000).toStringAsFixed(1)} k";
      }
    }

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 6,
            color: Color(0xffEBEBEB),
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: padd,
            child: Row(
              children: [
                Avatar(
                  size: 38,
                  asset: publication.user.avatar,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(publication.user.username),
                const Spacer(),
                Text(
                  timeago.format(publication.createAt),
                )
              ],
            ),
          ),
          AspectRatio(
            aspectRatio: 16 / 9,
            child: CachedNetworkImage(
              imageUrl: publication.imageUrl,
              height: 180,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: padd.copyWith(top: 1),
            child: Text(
              publication.title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ).copyWith(
              bottom: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ...List.generate(
                      reactionss.length,
                      (index) {
                        final reaction = reactionss[index];
                        final isActive =
                            reaction == publication.currenUserReactions;
                        return Padding(
                          padding: const EdgeInsets.only(
                            right: 7,
                          ),
                          child: Column(
                            children: [
                              SvgPicture.asset(
                                _getEmojiPath(reaction),
                                width: 25,
                                height: 25,
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Icon(
                                Icons.circle,
                                color: isActive
                                    ? Colors.redAccent
                                    : Colors.transparent,
                                size: 5,
                              )
                            ],
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                  ],
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      bottom: 5,
                    ),
                    child: FittedBox(
                      child: Row(
                        children: [
                          Text(
                              "${_getFormatCount(publication.countComents)} Comments"),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                              "${_getFormatCount(publication.countShares)} Shares"),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
