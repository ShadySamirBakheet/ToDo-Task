import 'package:flutter/material.dart';
import 'package:todo/core/resources/color_manager.dart';
import 'package:todo/core/resources/font_manager.dart';
import 'package:todo/core/resources/strings_manager.dart';
import 'package:todo/core/resources/values_manager.dart';
import 'package:todo/modules/user/presentation/bloc/cubit/auth_cubit.dart';

class SwitchAuth extends StatelessWidget {
  const SwitchAuth({super.key, this.isLogin = true});

  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          isLogin ? AppStrings.dontHaveAnAccount : AppStrings.haveAnAccount,
          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                fontSize: FontSize.s12,
              ),
        ),
        const SizedBox(width: AppSize.s8),
        GestureDetector(
          onTap: () {
            AuthCubit.cubit(context).changeAuthType();
          },
          child: Text(
            isLogin ? AppStrings.signUp : AppStrings.signIn,
            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                  color: ColorManager.primary,
                ),
          ),
        ),
      ],
    );
  }
}
