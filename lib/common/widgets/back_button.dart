import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:surf_places/common/consts/icons_consts.dart';
import 'package:surf_places/common/extensions/context_extensions.dart';
import 'package:surf_places/common/widgets/custom_svg_icon.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      mini: true,
      backgroundColor: context.colorExt.primaryColor,
      onPressed: () {
        context.pop();
      },
      child: CustomSvgIcon(
        icon: AppIcons.back,
        color: context.colorExt.secondaryColor,
      ),
    );
  }
}
