import 'package:flutter/material.dart';
import 'package:places_api/api_client.dart';
import 'package:surf_places/common/consts/icons_consts.dart';
import 'package:surf_places/common/extensions/context_extensions.dart';
import 'package:surf_places/common/widgets/custom_image_widget.dart';
import 'package:surf_places/common/widgets/custom_svg_icon.dart';
import 'package:surf_places/config/router/routes.dart';

class PlaceCardWidget extends StatelessWidget {
  const PlaceCardWidget({required this.place, super.key});

  final Place place;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        PlaceRoute(id: place.id).push(context);
      },
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            fit: StackFit.expand,
            children: [
              CustomImageWidget(path: place.urls.firstOrNull),
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
                  child: InkWell(
                    child: CustomSvgIcon(
                      icon: AppIcons.favorites,
                      color: context.colorExt.primaryColor,
                      height: 30,
                    ),
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
      ),
    );
  }
}
