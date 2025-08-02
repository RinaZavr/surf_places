import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:places_api/api_client.dart';
import 'package:surf_places/common/consts/icons_consts.dart';
import 'package:surf_places/common/extensions/context_extensions.dart';
import 'package:surf_places/common/widgets/custom_image_widget.dart';
import 'package:surf_places/common/widgets/custom_svg_icon.dart';
import 'package:surf_places/config/repositories/favorites_repository.dart';
import 'package:surf_places/config/router/routes.dart';

class PlaceCardWidget extends StatefulWidget {
  const PlaceCardWidget({required this.place, super.key, this.buttons});

  final Place place;
  final Widget? buttons;

  @override
  State<PlaceCardWidget> createState() => _PlaceCardWidgetState();
}

class _PlaceCardWidgetState extends State<PlaceCardWidget> {
  late final FavoritesRepository _favoritesRepository;

  @override
  void initState() {
    _favoritesRepository = GetIt.I.get<FavoritesRepository>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        PlaceRoute(id: widget.place.id).push(context);
      },
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            fit: StackFit.expand,
            children: [
              CustomImageWidget(path: widget.place.urls.firstOrNull),
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
                      Text(widget.place.name, style: context.textExt.text),
                      Text(
                        widget.place.description,
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
                  child:
                      widget.buttons ??
                      InkWell(
                        onTap: () {
                          _favoritesRepository.updateFavorites(
                            place: widget.place,
                            isDelete: _favoritesRepository.isFavorite(
                              widget.place,
                            ),
                          );
                          setState(() {});
                        },
                        child: CustomSvgIcon(
                          icon: _favoritesRepository.isFavorite(widget.place)
                              ? AppIcons.favoritesSelected
                              : AppIcons.favorites,
                          color: _favoritesRepository.isFavorite(widget.place)
                              ? context.colorExt.secondaryColor
                              : context.colorExt.primaryColor,
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
                    widget.place.type,
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
