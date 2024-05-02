import 'package:facebook_p1/facebook_ui/widgets/circle_button.dart';
import 'package:facebook_p1/icons/custom_icons.dart';
import 'package:flutter/material.dart';

class QuickActions extends StatelessWidget {
  const QuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: FittedBox(
        // este widget escala el contenido para que el contenido quepa en el ancho de dispositivo
        fit: BoxFit
            .scaleDown, // con este parametro escala la pantalla solo si el contenido se sale de las dimensiones originales
        child: Row(
          children: [
            _QuickButton(
              label: 'Gallery',
              iconData: CustomIcons.photos,
              color: Color(0xff92BE87),
            ),
            SizedBox(width: 15),
            _QuickButton(
              label: 'Tag friends',
              iconData: CustomIcons.user_friends,
              color: Color(0xff2880D4),
            ),
            SizedBox(width: 15),
            _QuickButton(
              label: 'Live',
              iconData: CustomIcons.video_camera,
              color: Color(0xffFb7171),
            ),
          ],
        ),
      ),
    );
  }
}

// se le coloca el guion bajo para que sea un clase privada
class _QuickButton extends StatelessWidget {
  const _QuickButton({
    required this.label,
    required this.iconData,
    required this.color,
    super.key,
  });

  final IconData iconData;
  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: color.withOpacity(0.3),
      ),
      child: Row(
        children: [
          circleButton(
            color: color.withOpacity(0.6),
            icon: CustomIcons.photos,
          ),
          const SizedBox(width: 10),
          Text(
            label,
            style: TextStyle(
              color: color,
            ),
          )
        ],
      ),
    );
  }
}
