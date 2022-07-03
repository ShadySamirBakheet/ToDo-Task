import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:todo/core/presentation/bloc/cubit/passwordmanage_cubit.dart';

class TextFieldApp extends StatelessWidget {
  const TextFieldApp({
    super.key,
    required this.label,
    this.errorText,
    this.controller,
    this.keyboardType,
    this.validator,
    this.prefix,
    this.onChanged,
    this.isPassword = false,
    this.isPhone = false,
    this.enabled = true,
    this.inputBackground,
    this.style,
    this.padding,
    this.multiline = false,
    this.isTimePicker = false,
    this.onChangedTime,
  });

  final String label;
  final String? errorText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool enabled;
  final bool isPassword;
  final FormFieldValidator<String>? validator;
  final Widget? prefix;
  final bool isPhone;
  final bool multiline;
  final bool isTimePicker;
  final Function(String?)? onChanged;

  final Color? inputBackground;
  final TextStyle? style;
  final EdgeInsetsGeometry? padding;
  final Function(DateTime?)? onChangedTime;

  @override
  Widget build(BuildContext context) {
    var _obscureText = true;

    final timePicker = FormBuilderDateTimePicker(
      name: label,
      controller: controller,
      initialDate: DateTime.now(),
      initialTime: TimeOfDay.now(),
      onChanged: onChangedTime,
      decoration: InputDecoration(
        hintStyle: style,
        labelStyle: style,
        errorStyle: style,
        helperStyle: style,
        prefixIcon: prefix,
        hintText: label,
        fillColor: inputBackground,
        suffixIcon: isPassword
            ? GestureDetector(
                onTap: () {
                  PasswordmanageCubit.cubit(context)
                      .changeVisibility(isVisible: !_obscureText);
                },
                child: Icon(
                  isPassword && _obscureText
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                ),
              )
            : null,
      ),
    );

    return BlocProvider(
      create: (context) => PasswordmanageCubit(),
      child: BlocBuilder<PasswordmanageCubit, PasswordmanageState>(
        builder: (context, state) {
          if (state is PasswordmanageChange) {
            _obscureText = state.isVisable;
          } else {
            _obscureText = isPassword;
          }
          return Padding(
            padding: padding ??
                const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
            child: isTimePicker
                ? timePicker
                : FormBuilderTextField(
                    name: label,
                    controller: controller,
                    keyboardType: keyboardType,
                    obscureText: isPassword && _obscureText,
                    enabled: enabled,
                    validator: validator,
                    onChanged: onChanged ?? (value) {},
                    style: Theme.of(context).textTheme.bodyText1,
                    maxLines: multiline ? 5 : 1,
                    decoration: InputDecoration(
                      hintStyle: style,
                      labelStyle: style,
                      errorStyle: style,
                      helperStyle: style,
                      prefixIcon: prefix,
                      hintText: label,
                      fillColor: inputBackground,
                      suffixIcon: isPassword
                          ? GestureDetector(
                              onTap: () {
                                PasswordmanageCubit.cubit(context)
                                    .changeVisibility(isVisible: !_obscureText);
                              },
                              child: Icon(
                                isPassword && _obscureText
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                              ),
                            )
                          : null,
                    ),
                  ),
          );
        },
      ),
    );
  }
}
