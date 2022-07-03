import 'package:flutter/material.dart';
import 'package:todo/core/resources/assets_manager.dart';
import 'package:todo/core/resources/values_manager.dart';

class ErrorIndicator extends StatelessWidget {
  const ErrorIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        IconAssets.add,
        width: AppSize.s160,
        height: AppSize.s160,
      ),
    );
  }
}
