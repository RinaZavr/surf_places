import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:surf_places/common/consts/icons_consts.dart';
import 'package:surf_places/common/extensions/context_extensions.dart';
import 'package:surf_places/common/widgets/custom_svg_icon.dart';

class CustomImageWidget extends StatelessWidget {
  const CustomImageWidget({
    required this.path,
    super.key,
    this.height,
    this.width,
    this.fit,
  });

  final String? path;
  final double? height;
  final double? width;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: path == null || path!.isEmpty
          ? _getErrorWidget(context)
          : CachedNetworkImage(
              imageUrl: path ?? '',
              fit: fit ?? BoxFit.cover,
              height: height,
              width: width,
              errorWidget: (context, url, error) {
                return _getErrorWidget(context);
              },
            ),
    );
  }

  Widget _getErrorWidget(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            context.colorExt.secondaryColor,
            context.colorExt.gradientSecondaryColor,
          ],
        ),
      ),
      child: CustomSvgIcon(
        icon: AppIcons.photo,
        color: context.colorExt.primaryColor,
      ),
    );
  }
}
