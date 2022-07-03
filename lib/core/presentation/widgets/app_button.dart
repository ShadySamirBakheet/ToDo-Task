import 'package:flutter/material.dart';
import 'package:todo/core/resources/values_manager.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    this.style,
    this.color,
    this.padding,
  });

  final String buttonText;
  final Function() onPressed;
  final TextStyle? style;
  final Color? color;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          padding ?? const EdgeInsets.symmetric(horizontal: AppPadding.p32),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: color,
          //enableFeedback: false,
        ),
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: style ?? Theme.of(context).textTheme.button,
        ),
      ),
    );
  }
}
