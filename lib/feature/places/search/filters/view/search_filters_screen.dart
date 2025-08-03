import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:surf_places/common/consts/icons_consts.dart';
import 'package:surf_places/common/extensions/context_extensions.dart';
import 'package:surf_places/common/widgets/back_button.dart';
import 'package:surf_places/common/widgets/custom_svg_icon.dart';
import 'package:surf_places/feature/places/search/filters/data/filter_model.dart';

class SearchFiltersScreen extends StatefulWidget {
  const SearchFiltersScreen({super.key});

  @override
  State<SearchFiltersScreen> createState() => _SearchFiltersScreenState();
}

class _SearchFiltersScreenState extends State<SearchFiltersScreen> {
  final filters = [
    FilterModel(icon: AppIcons.hotelFilter, title: 'Отель', type: 'hotel'),
    FilterModel(
      icon: AppIcons.restourantFilter,
      title: 'Ресторан',
      type: 'restourant',
    ),
    FilterModel(
      icon: AppIcons.particularFilter,
      title: 'Особое место',
      type: 'other, shopping, temple, theatre, monument',
    ),
    FilterModel(icon: AppIcons.parkFilter, title: 'Парк', type: 'park'),
    FilterModel(icon: AppIcons.museumFilter, title: 'Музей', type: 'museum'),
    FilterModel(icon: AppIcons.cafeFilter, title: 'Кафе', type: 'cafe'),
  ];

  List<String> selectedFilters = [];

  RangeValues _currentRangeValues = const RangeValues(10, 30);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Align(child: const CustomBackButton()),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: InkWell(
              onTap: () {
                selectedFilters = [];
                setState(() {});
              },
              child: Text(
                'Очистить',
                style: context.textExt.text.copyWith(
                  color: context.colorExt.accentColor,
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: InkWell(
          onTap: () {
            context.pop(selectedFilters);
          },
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: context.colorExt.accentColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              'ПОКАЗАТЬ',
              style: context.textExt.subtitle.copyWith(
                color: context.colorExt.cardColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Text(
                'КАТЕГОРИИ',
                style: context.textExt.superSmall.copyWith(
                  color: context.colorExt.trinityColor,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                itemBuilder: (context, index) {
                  return Column(
                    spacing: 12,
                    children: [
                      InkWell(
                        onTap: () {
                          if (selectedFilters.contains(filters[index].type)) {
                            selectedFilters.remove(filters[index].type);
                          } else {
                            selectedFilters.add(filters[index].type);
                          }
                          setState(() {});
                        },
                        child: IntrinsicHeight(
                          child: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: context.colorExt.accentColor
                                      .withValues(alpha: 0.16),
                                  shape: BoxShape.circle,
                                ),
                                child: CustomSvgIcon(
                                  icon: filters[index].icon,
                                  color: context.colorExt.accentColor,
                                ),
                              ),
                              if (selectedFilters.contains(filters[index].type))
                                DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: context.colorExt.secondaryColor,
                                    shape: BoxShape.circle,
                                  ),
                                  child: CustomSvgIcon(
                                    icon: AppIcons.choice,
                                    color: context.colorExt.primaryColor,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                      Text(
                        filters[index].title,
                        style: context.textExt.superSmall,
                      ),
                    ],
                  );
                },
                itemCount: filters.length,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Расстояние', style: context.textExt.text),
                  Text(
                    'От 10 до 30 км',
                    style: context.textExt.text.copyWith(
                      color: context.colorExt.infoColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: RangeSlider(
                values: _currentRangeValues,
                min: 10,
                max: 30,
                divisions: 20,
                inactiveColor: context.colorExt.trinityColor,
                activeColor: context.colorExt.accentColor,
                labels: RangeLabels(
                  _currentRangeValues.start.round().toString(),
                  _currentRangeValues.end.round().toString(),
                ),
                onChanged: (values) {
                  setState(() {
                    _currentRangeValues = values;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
