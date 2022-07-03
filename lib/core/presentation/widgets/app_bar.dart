import 'package:flutter/material.dart';

import 'package:todo/core/resources/color_manager.dart';
import 'package:todo/core/resources/values_manager.dart';

class MyAppBar extends AppBar {
  MyAppBar({
    super.key,
    required this.titleText,
    this.menu,
    this.withBack = true,
  });

  final String titleText;
  final List<Widget>? menu;
  final bool withBack;

  AppBar getAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        titleText,
        style: Theme.of(context).appBarTheme.titleTextStyle,
        // textAlign: TextAlign.center,
      ),
      backgroundColor: ColorManager.white,
      actions: menu,
      elevation: AppSize.s0,
      leading: withBack
          ? BackButton(
              color: ColorManager.black,
              onPressed: () {
                Navigator.pop(context);
              },
            )
          : const SizedBox(),
    );
  }
}
