import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/resources/assets_manager.dart';
import 'package:todo/core/resources/routes_manager.dart';
import 'package:todo/core/resources/strings_manager.dart';
import 'package:todo/core/resources/values_manager.dart';
import 'package:todo/modules/user/presentation/bloc/cubit/auth_cubit.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.microtask(() => AuthCubit.cubit(context).checkUserAuthFun());
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is UserAuthState) {
          Future.delayed(const Duration(seconds: 3), () {
            Navigator.of(context).pushReplacementNamed(Routes.homeRoute);
          });
          return;
        }
        if (state is UserNotAuthState) {
          Future.delayed(const Duration(seconds: 3), () {
            Navigator.of(context).pushReplacementNamed(Routes.loginRoute);
          });
          return;
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(AppPadding.p32),
                    child: Text(
                      AppStrings.welcome,
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
