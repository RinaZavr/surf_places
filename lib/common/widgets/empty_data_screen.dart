import 'package:flutter/material.dart';
import 'package:surf_places/common/extensions/context_extensions.dart';
import 'package:surf_places/common/widgets/custom_svg_icon.dart';

class EmptyDataScreen extends StatelessWidget {
  const EmptyDataScreen({
    required this.icon,
    required this.text,
    super.key,
    this.subtitle,
  });

  final String icon;
  final String text;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 8,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: CustomSvgIcon(
              icon: icon,
              color: context.colorExt.trinityColor,
              height: MediaQuery.of(context).size.height * 0.1,
            ),
          ),
          Text(
            text,
            style: context.textExt.subtitle.copyWith(
              color: context.colorExt.trinityColor,
            ),
          ),
          if (subtitle != null)
            Text(
              subtitle!,
              style: context.textExt.small.copyWith(
                color: context.colorExt.trinityColor,
              ),
            ),
        ],
      ),
    );
  }
}
