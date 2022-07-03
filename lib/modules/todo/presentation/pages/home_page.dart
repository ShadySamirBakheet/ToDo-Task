import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/presentation/widgets/app_bar.dart';
import 'package:todo/core/resources/color_manager.dart';
import 'package:todo/core/resources/routes_manager.dart';
import 'package:todo/core/resources/values_manager.dart';
import 'package:todo/modules/todo/presentation/bloc/cubit/view_notes_cubit.dart';
import 'package:todo/modules/todo/presentation/widgets/error_indicator.dart';
import 'package:todo/modules/todo/presentation/widgets/view_note.dart';
import 'package:todo/modules/user/presentation/bloc/cubit/auth_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.microtask(ViewNotesCubit.cubit(context).getData);
    return Scaffold(
      appBar: MyAppBar(
        withBack: false,
        titleText: AuthCubit.cubit(context).user?.userName ?? 'ToDo App',
        menu: [
          IconButton(
            onPressed: () => Navigator.of(context)
                .pushNamed(Routes.addNoteRoute)
                .then((value) => ViewNotesCubit.cubit(context).getData()),
            icon: Icon(
              Icons.add,
              size: AppSize.s24,
              color: ColorManager.black,
              semanticLabel: 'add task',
            ),
          ),
          BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is UserOutState) {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  Routes.initRoute,
                  (route) => false,
                );
              }
            },
            builder: (context, state) {
              return IconButton(
                onPressed: AuthCubit.cubit(context).logOut,
                icon: Icon(
                  Icons.exit_to_app,
                  size: AppSize.s24,
                  color: ColorManager.black,
                  semanticLabel: 'Sign Out',
                ),
              );
            },
          )
        ],
      ).getAppBar(context),
      body: BlocConsumer<ViewNotesCubit, ViewNotesState>(
        listener: (context, state) {
          if (state is DeleteNotesErrorState) {}
        },
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (state is ViewNotesDoneState)
                Expanded(
                  child: ListView.builder(
                    itemCount: state.data.length,
                    itemBuilder: (context, index) {
                      return ViewNote(
                        note: state.data[index],
                      );
                    },
                  ),
                ),
              if (state is ViewNotesErrorState)
                const Center(child: ErrorIndicator()),
              if (state is ViewNotesLoadingState)
                const Center(
                  child: CircularProgressIndicator(),
                ),
            ],
          );
        },
      ),
    );
  }
}
