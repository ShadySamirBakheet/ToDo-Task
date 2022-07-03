import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/app/injection_container.dart';
import 'package:todo/core/domain/usecases/use_case.dart';
import 'package:todo/core/resources/strings_manager.dart';
import 'package:todo/modules/user/data/models/user_model.dart';
import 'package:todo/modules/user/domain/entities/user.dart';
import 'package:todo/modules/user/domain/usecases/check_user_auth.dart';
import 'package:todo/modules/user/domain/usecases/login_user.dart';
import 'package:todo/modules/user/domain/usecases/user_sign_out.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final CheckUserAuth checkUserAuth = sl();
  final LoginUser loginUser = sl();
  final UserSignOut userSignOut = sl();

  User? user;

  static AuthCubit cubit(BuildContext context) => BlocProvider.of(context);

  bool isLogin = true;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController name = TextEditingController();
  final TextEditingController emial = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  void changeAuthType() {
    isLogin = !isLogin;
    emit(AuthTypeState());
  }

  String? validatorConfirmPassword(String? value) {
    if (value == null || value != password.text) {
      return AppStrings.samePasswordsMsg;
    }
    return null;
  }

  String? validatorPassword(String? value) {
    if (value != null && value.length < 6) {
      return AppStrings.checkpasswordstrength;
    }
    return null;
  }

  String? validatorName(String? value) {
    if (value == null) {
      return AppStrings.fullNameMsg;
    }
    return null;
  }

  String? validatorEmail(String? value) {
    if (value == null) {
      return AppStrings.emailMsg;
    }
    return null;
  }

  Future<void> authFun() async {
    if (formKey.currentState?.validate() ?? false) {
      emit(AuthLoadingState());
      final user = UsersModel(
        userEmail: emial.text,
        userName: name.text,
        password: password.text,
      );

      final res = await loginUser.call(
        UserLoginPrams(
          user: user,
          isLogin: isLogin,
        ),
      );

      print('res : $res');

      res.fold(
        (failure) => emit(AuthErrorState()),
        (user) {
          user = user;
          emit(AuthDoneState());
        },
      );
    }
  }

  Future<void> checkUserAuthFun() async {
    final res = await checkUserAuth(NoParams());

    res.fold(
      (failure) => emit(UserNotAuthState()),
      (user) {
        this.user = user;
        emit(UserAuthState());
      },
    );
  }

  Future logOut() async {
    final res = await userSignOut(NoParams());

    res.fold(
      (failure) => emit(UserNotAuthState()),
      (r) => emit(UserOutState()),
    );
  }
}
