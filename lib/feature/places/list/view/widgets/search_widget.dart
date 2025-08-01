import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:surf_places/common/consts/icons_consts.dart';
import 'package:surf_places/common/extensions/context_extensions.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        fillColor: context.colorExt.cardColor,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        hintText: 'Поиск',
        hintStyle: context.textExt.text.copyWith(
          color: context.colorExt.trinityColor,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: SvgPicture.asset(
            AppIcons.search,
            colorFilter: ColorFilter.mode(
              context.colorExt.trinityColor,
              BlendMode.srcIn,
            ),
            height: 30,
          ),
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: InkWell(
            onTap: () {},
            child: SvgPicture.asset(
              AppIcons.filter,
              colorFilter: ColorFilter.mode(
                context.colorExt.accentColor,
                BlendMode.srcIn,
              ),
              height: 30,
            ),
          ),
        ),
      ),
    );
  }
}
