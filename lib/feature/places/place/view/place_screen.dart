import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screenshot/screenshot.dart';
import 'package:surf_places/common/consts/icons_consts.dart';
import 'package:surf_places/common/extensions/context_extensions.dart';
import 'package:surf_places/common/utils/utils.dart';
import 'package:surf_places/common/widgets/back_button.dart';
import 'package:surf_places/common/widgets/custom_svg_icon.dart';
import 'package:surf_places/feature/places/place/cubit/place_cubit.dart';
import 'package:surf_places/feature/places/place/view/widgets/images_carousel.dart';

class PlaceScreen extends StatefulWidget {
  const PlaceScreen({required this.id, super.key});

  final int id;

  @override
  State<PlaceScreen> createState() => _PlaceScreenState();
}

class _PlaceScreenState extends State<PlaceScreen> {
  late PlaceCubit _cubit;
  ScreenshotController screenshotController = ScreenshotController();

  @override
  void initState() {
    _cubit = PlaceCubit()..getPlace(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
        floatingActionButton: CustomBackButton(),
        body: BlocBuilder<PlaceCubit, PlaceState>(
          builder: (context, state) {
            if (state is PlaceLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is PlaceError) {
              return Center(
                child: Text(
                  state.error,
                  style: context.textExt.subtitle.copyWith(
                    color: context.colorExt.importantColor,
                  ),
                ),
              );
            }
            if (state is PlaceLoaded) {
              return Screenshot(
                controller: screenshotController,
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: ImagesCarousel(images: state.place.urls),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          state.place.name,
                          style: context.textExt.title,
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: Text(
                          state.place.type,
                          style: context.textExt.smallBold,
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          state.place.description,
                          style: context.textExt.small,
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: Divider(color: context.colorExt.trinityColor),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () => sharePlace(screenshotController),
                              child: Row(
                                spacing: 8,
                                children: [
                                  CustomSvgIcon(icon: AppIcons.share),
                                  Text(
                                    'Поделиться',
                                    style: context.textExt.small,
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Row(
                                spacing: 8,
                                children: [
                                  CustomSvgIcon(icon: AppIcons.favorites),
                                  Text(
                                    'В Избранное',
                                    style: context.textExt.small,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
