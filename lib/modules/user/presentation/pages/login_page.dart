import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/presentation/widgets/app_bar.dart';
import 'package:todo/core/resources/assets_manager.dart';
import 'package:todo/core/resources/routes_manager.dart';
import 'package:todo/core/resources/strings_manager.dart';
import 'package:todo/core/resources/values_manager.dart';
import 'package:todo/modules/user/presentation/bloc/cubit/auth_cubit.dart';
import 'package:todo/modules/user/presentation/widgets/form_auth.dart';
import 'package:todo/modules/user/presentation/widgets/switch_auth.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthDoneState) {
          Navigator.of(context).pushReplacementNamed(Routes.homeRoute);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: MyAppBar(
            titleText: AppStrings.signIn,
            withBack: false,
          ).getAppBar(context),
          body: ListView(
            padding: const EdgeInsets.all(AppPadding.p16),
            children: [
              const SizedBox(
                height: AppSize.s75,
              ),
              Center(
                child: Hero(
                  tag: 'Login',
                  child: Image.asset(
                    IconAssets.todo,
                    width: AppSize.s140,
                    height: AppSize.s140,
                  ),
                ),
              ),
              const SizedBox(
                height: AppSize.s75,
              ),
              BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  return FormAuth(
                    isLogin: AuthCubit.cubit(context).isLogin,
                  );
                },
              ),
              const SizedBox(
                height: AppSize.s32,
              ),
              BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  return SwitchAuth(
                    isLogin: AuthCubit.cubit(context).isLogin,
                  );
                },
              ),
              const SizedBox(
                height: AppSize.s32,
              ),
            ],
          ),
        );
      },
    );
  }
}
