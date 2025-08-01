import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places_api/api_client.dart';
import 'package:surf_places/common/consts/icons_consts.dart';
import 'package:surf_places/common/extensions/context_extensions.dart';

class PlaceCardWidget extends StatelessWidget {
  const PlaceCardWidget({required this.place, super.key});

  final Place place;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          fit: StackFit.expand,
          children: [
            CachedNetworkImage(
              imageUrl: place.urls.firstOrNull ?? '',
              fit: BoxFit.cover,
              errorWidget: (context, url, error) {
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
                  child: SvgPicture.asset(
                    AppIcons.photo,
                    colorFilter: ColorFilter.mode(
                      context.colorExt.primaryColor,
                      BlendMode.srcIn,
                    ),
                  ),
                );
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(color: context.colorExt.cardColor),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  spacing: 4,
                  children: [
                    Text(place.name, style: context.textExt.text),
                    Text(
                      place.description,
                      style: context.textExt.small,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: SvgPicture.asset(
                  AppIcons.favorites,
                  colorFilter: ColorFilter.mode(
                    context.colorExt.primaryColor,
                    BlendMode.srcIn,
                  ),
                  height: 30,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  place.type,
                  style: context.textExt.smallBold.copyWith(
                    color: context.colorExt.primaryColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
