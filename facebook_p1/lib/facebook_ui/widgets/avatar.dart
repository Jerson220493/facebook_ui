import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final double size;
  final String asset;
  final double borderWith;
  const Avatar({
    super.key,
    required this.size,
    required this.asset,
    this.borderWith = 0,
  });

  @override
  Widget build(BuildContext context) {
    final fromNetwork =
        asset.startsWith("http://") || asset.startsWith("https://");
    final providerImage = fromNetwork
        ? NetworkImage(asset)
        : AssetImage(
            asset); // con el fin que al llamar la clase avatar en un lugar se envia el asset local y con faker se envia una imagen de internet
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          width: borderWith,
          color: Colors.white,
        ),
        image: DecorationImage(
          image: providerImage as ImageProvider,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
