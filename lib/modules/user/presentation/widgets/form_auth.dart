import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/presentation/widgets/app_button.dart';
import 'package:todo/core/presentation/widgets/form_builder.dart';
import 'package:todo/core/resources/color_manager.dart';
import 'package:todo/core/resources/strings_manager.dart';
import 'package:todo/core/resources/values_manager.dart';
import 'package:todo/modules/user/presentation/bloc/cubit/auth_cubit.dart';

class FormAuth extends StatelessWidget {
  const FormAuth({super.key, this.isLogin = true});

  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Stack(
          children: [
            if (state is AuthLoadingState)
              const Center(child: CircularProgressIndicator()),
            Form(
              key: AuthCubit.cubit(context).formKey,
              child: Column(
                children: [
                  if (state is AuthErrorState)
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(AppPadding.p16),
                        child: Text(
                          'Error Occur',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(color: ColorManager.red),
                        ),
                      ),
                    ),
                  TextFieldApp(
                    controller: AuthCubit.cubit(context).emial,
                    label: AppStrings.email,
                    keyboardType: TextInputType.emailAddress,
                    validator: AuthCubit.cubit(context).validatorEmail,
                  ),
                  if (!isLogin)
                    TextFieldApp(
                      controller: AuthCubit.cubit(context).name,
                      label: AppStrings.fullName,
                      keyboardType: TextInputType.name,
                      validator: AuthCubit.cubit(context).validatorName,
                    ),
                  TextFieldApp(
                    controller: AuthCubit.cubit(context).password,
                    label: AppStrings.password,
                    keyboardType: TextInputType.visiblePassword,
                    isPassword: true,
                    validator: AuthCubit.cubit(context).validatorPassword,
                  ),
                  if (!isLogin)
                    TextFieldApp(
                      controller: AuthCubit.cubit(context).confirmPassword,
                      label: AppStrings.confirmPassword,
                      keyboardType: TextInputType.visiblePassword,
                      isPassword: true,
                      validator:
                          AuthCubit.cubit(context).validatorConfirmPassword,
                      onChanged:
                          AuthCubit.cubit(context).validatorConfirmPassword,
                    ),
                  const SizedBox(
                    height: AppSize.s32,
                  ),
                  AppButton(
                    buttonText: isLogin ? AppStrings.signIn : AppStrings.signUp,
                    onPressed: AuthCubit.cubit(context).authFun,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
