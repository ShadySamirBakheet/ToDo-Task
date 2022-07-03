import 'package:flutter/material.dart';
import 'package:todo/core/presentation/widgets/app_button.dart';
import 'package:todo/core/presentation/widgets/form_builder.dart';
import 'package:todo/core/resources/strings_manager.dart';
import 'package:todo/core/resources/values_manager.dart';
import 'package:todo/modules/todo/presentation/bloc/cubit/add_note_cubit.dart';

class AddNoteForm extends StatelessWidget {
  const AddNoteForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: AddNoteCubit.cubit(context).formKey,
      child: Column(
        children: [
          const SizedBox(
            height: AppSize.s64,
          ),
          TextFieldApp(
            controller: AddNoteCubit.cubit(context).noteTitle,
            label: AppStrings.noteTitle,
            keyboardType: TextInputType.name,
            validator: AddNoteCubit.cubit(context).validatorTitle,
          ),
          TextFieldApp(
            controller: AddNoteCubit.cubit(context).noteTxt,
            label: AppStrings.note,
            keyboardType: TextInputType.multiline,
            validator: AddNoteCubit.cubit(context).validatorNote,
            multiline: true,
          ),
          TextFieldApp(
            onChangedTime: AddNoteCubit.cubit(context).noteTimeFun,
            label: AppStrings.note,
            isTimePicker: true,
          ),
          const SizedBox(
            height: AppSize.s32,
          ),
          AppButton(
            buttonText: AppStrings.save,
            onPressed: AddNoteCubit.cubit(context).saveNote,
          ),
        ],
      ),
    );
  }
}
