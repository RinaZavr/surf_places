import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:surf_places/common/consts/icons_consts.dart';
import 'package:surf_places/common/extensions/context_extensions.dart';
import 'package:surf_places/common/widgets/custom_svg_icon.dart';
import 'package:surf_places/config/repositories/settings_repository.dart';
import 'package:surf_places/config/router/routes.dart';
import 'package:surf_places/feature/onboarding/data/onboarding_model.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key, this.fromSettings = false});

  final bool fromSettings;

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentPage = 0;
  final data = [
    OnboardingModel(
      image: AppIcons.onboardingFirst,
      title: 'Добро пожаловать в Путеводитель',
      description: 'Ищи новые локации и сохраняй самые любимые.',
    ),
    OnboardingModel(
      image: AppIcons.onboardingSecond,
      title: 'Построй маршрут и отправляйся в путь',
      description: 'Достигай цели максимально быстро и комфортно.',
    ),
    OnboardingModel(
      image: AppIcons.onboardingThird,
      title: 'Добавляй места, которые нашёл сам',
      description: 'Делись самыми интересными и помоги нам стать лучше!',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: _currentPage == 2
          ? null
          : Padding(
              padding: const EdgeInsets.all(16),
              child: InkWell(
                onTap: () {
                  GetIt.I.get<SettingsRepository>().saveOnboarding();
                  PlacesListRoute().go(context);
                },
                child: Text(
                  'Пропустить',
                  style: context.textExt.text.copyWith(
                    color: context.colorExt.accentColor,
                  ),
                ),
              ),
            ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          spacing: 8,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(data.length, (i) {
                final isActive = i == _currentPage;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: isActive ? 24 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: isActive
                        ? context.colorExt.accentColor
                        : context.colorExt.trinityColor,
                    borderRadius: BorderRadius.circular(isActive ? 4 : 100),
                  ),
                );
              }),
            ),
            SizedBox(
              height: 56, // это высота кнопки
              width: double.infinity,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: _currentPage == 2
                    ? InkWell(
                        onTap: () => PlacesListRoute().go(context),
                        child: Container(
                          decoration: BoxDecoration(
                            color: context.colorExt.accentColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'НА СТАРТ',
                            style: context.textExt.subtitle.copyWith(
                              color: context.colorExt.cardColor,
                            ),
                          ),
                        ),
                      )
                    : const SizedBox.shrink(), // но высота всё равно сохраняется
              ),
            ),
          ],
        ),
      ),
      body: PageView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              spacing: 8,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 32),
                  child: CustomSvgIcon(icon: data[index].image),
                ),
                Text(
                  data[index].title,
                  style: context.textExt.title,
                  textAlign: TextAlign.center,
                ),
                Text(
                  data[index].description,
                  style: context.textExt.small.copyWith(
                    color: context.colorExt.infoColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        },
        itemCount: 3,
        onPageChanged: (index) => setState(() => _currentPage = index),
      ),
    );
  }
}
