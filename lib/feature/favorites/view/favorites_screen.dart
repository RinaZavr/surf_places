import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get_it/get_it.dart';
import 'package:screenshot/screenshot.dart';
import 'package:surf_places/common/consts/icons_consts.dart';
import 'package:surf_places/common/extensions/context_extensions.dart';
import 'package:surf_places/common/utils/utils.dart';
import 'package:surf_places/common/widgets/custom_svg_icon.dart';
import 'package:surf_places/common/widgets/empty_data_screen.dart';
import 'package:surf_places/config/repositories/favorites_repository.dart';
import 'package:surf_places/config/styles/colors.dart';
import 'package:surf_places/feature/places/list/view/widgets/place_card_widget.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  late FavoritesRepository _repository;
  List<ScreenshotController> screenshotControllers = [];

  @override
  void initState() {
    _repository = GetIt.I.get<FavoritesRepository>();
    screenshotControllers = List.generate(
      _repository.favorites.length,
      (index) => ScreenshotController(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text('Избранное', style: context.textExt.subtitle),
        centerTitle: true,
      ),
      body: _repository.favorites.isEmpty
          ? EmptyDataScreen(
              icon: AppIcons.way,
              text: 'Вы пока ничего не добавили в избранное',
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: ListView.separated(
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 24),
                itemBuilder: (context, index) {
                  return Slidable(
                    key: UniqueKey(),
                    endActionPane: ActionPane(
                      extentRatio: 0.3,
                      motion:
                          const DrawerMotion(), // Можешь поменять на ScrollMotion
                      children: [
                        CustomSlidableAction(
                          onPressed: (context) {
                            _repository.updateFavorites(
                              place: _repository.favorites[index],
                              isDelete: true,
                            );
                            setState(() {});
                          },
                          backgroundColor: context.colorExt.importantColor,
                          foregroundColor: AppColors.white,
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(16),
                            bottomRight: Radius.circular(16),
                          ),
                          child: Column(
                            spacing: 8,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomSvgIcon(
                                icon: AppIcons.clear,
                                color: AppColors.white,
                              ),
                              Text(
                                'Удалить',
                                style: context.textExt.smallBold.copyWith(
                                  color: AppColors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    child: Screenshot(
                      controller: screenshotControllers[index],
                      child: PlaceCardWidget(
                        place: _repository.favorites[index],
                        buttons: Row(
                          spacing: 16,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            InkWell(
                              onTap: () =>
                                  sharePlace(screenshotControllers[index]),
                              child: CustomSvgIcon(
                                icon: AppIcons.share,
                                color: context.colorExt.primaryColor,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                _repository.updateFavorites(
                                  place: _repository.favorites[index],
                                  isDelete: true,
                                );
                                setState(() {});
                              },
                              child: CustomSvgIcon(
                                icon: AppIcons.clear,
                                color: context.colorExt.primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                itemCount: _repository.favorites.length,
              ),
            ),
    );
  }
}
