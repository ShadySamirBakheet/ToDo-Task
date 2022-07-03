import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/presentation/widgets/app_bar.dart';
import 'package:todo/core/resources/color_manager.dart';
import 'package:todo/core/resources/strings_manager.dart';
import 'package:todo/modules/todo/presentation/bloc/cubit/add_note_cubit.dart';
import 'package:todo/modules/todo/presentation/widgets/add_note_form.dart';

class AddNotePage extends StatelessWidget {
  const AddNotePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNoteCubit, AddNoteState>(
      listener: (context, state) {
        if (state is NoteSavedDoneState) {
          Navigator.of(context).pop();
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: MyAppBar(
            titleText: AddNoteCubit.cubit(context).update
                ? AppStrings.updateNote
                : AppStrings.addNote,
            menu: [
              IconButton(
                onPressed: AddNoteCubit.cubit(context).saveNote,
                icon: Icon(
                  Icons.save,
                  color: ColorManager.grey,
                ),
              ),
            ],
          ).getAppBar(context),
          body: ListView(
            children: const [AddNoteForm()],
          ),
        );
      },
    );
  }
}
