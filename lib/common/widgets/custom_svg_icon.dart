import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:surf_places/common/extensions/context_extensions.dart';

class CustomSvgIcon extends StatelessWidget {
  const CustomSvgIcon({
    required this.icon,
    super.key,
    this.color,
    this.height,
    this.width,
  });

  final String icon;
  final Color? color;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      icon,
      colorFilter: ColorFilter.mode(
        color ?? context.colorExt.secondaryColor,
        BlendMode.srcIn,
      ),
      height: height,
      width: width,
    );
  }
}
