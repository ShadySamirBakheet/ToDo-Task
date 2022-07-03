import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'passwordmanage_state.dart';

class PasswordmanageCubit extends Cubit<PasswordmanageState> {
  PasswordmanageCubit() : super(PasswordmanageInitial());

  static PasswordmanageCubit cubit(BuildContext context) =>
      BlocProvider.of(context);

  void changeVisibility({required bool isVisible}) {
    emit(PasswordmanageChange(isVisable: isVisible));
  }
}
