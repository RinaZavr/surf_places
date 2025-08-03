import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_places/common/consts/icons_consts.dart';
import 'package:surf_places/common/extensions/context_extensions.dart';
import 'package:surf_places/common/notifiers/search_notifier.dart';
import 'package:surf_places/common/widgets/custom_svg_icon.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({required this.isSearchNow, super.key});

  final ValueChanged<bool> isSearchNow;

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  FocusNode focusNode = FocusNode();
  TextEditingController controller = TextEditingController();
  Timer? _debounce;
  bool isTyping = false;

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    if (!mounted) return;
    if (!isTyping) {
      controller.text = context.watch<SearchNotifier>().query ?? '';
    }
    super.didChangeDependencies();
  }

  void _onSearchChanged(String value) {
    if (!mounted) return;
    _debounce?.cancel();
    setState(() {
      isTyping = true;
    });
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (!mounted) return;

      setState(() {
        isTyping = false;
      });
    });
    context.search.changeQuery(query: value);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      controller: controller,
      onTap: () {
        focusNode.requestFocus();
        widget.isSearchNow(true);
      },
      onChanged: (value) async {
        if (value.length >= 3) {
          await Future.delayed(const Duration(milliseconds: 500), () {
            _onSearchChanged(value);
          });
        }
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Поле не должно быть пустым';
        }
        if (value.length < 3) {
          return 'Минимум 3 символа';
        }
        return null;
      },
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
          child: CustomSvgIcon(
            icon: AppIcons.search,
            color: context.colorExt.trinityColor,
            height: 30,
          ),
        ),
        suffixIcon: focusNode.hasFocus
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  spacing: 8,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: () {
                        controller.clear();
                        focusNode.unfocus();
                        widget.isSearchNow(false);
                      },
                      child: CustomSvgIcon(icon: AppIcons.clear, height: 30),
                    ),
                    InkWell(
                      onTap: () {},
                      child: CustomSvgIcon(
                        icon: AppIcons.filter,
                        color: context.colorExt.accentColor,
                        height: 30,
                      ),
                    ),
                  ],
                ),
              )
            : null,
      ),
    );
  }
}
