import 'package:flutter/material.dart';
import 'package:todo/core/resources/color_manager.dart';
import 'package:todo/core/resources/routes_manager.dart';
import 'package:todo/core/resources/values_manager.dart';
import 'package:todo/modules/todo/domain/entities/todo.dart';
import 'package:todo/modules/todo/presentation/bloc/cubit/add_note_cubit.dart';
import 'package:todo/modules/todo/presentation/bloc/cubit/view_notes_cubit.dart';

class ViewNote extends StatelessWidget {
  const ViewNote({super.key, required this.note});

  final Note note;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: AppSize.s0p5,
      margin: const EdgeInsets.all(AppPadding.p8),
      shadowColor: ColorManager.inputBackground,
      child: ListTile(
        contentPadding: const EdgeInsets.all(AppPadding.p16),
        leading: CircleAvatar(
          radius: AppSize.s24,
          backgroundColor: ColorManager.gold,
          child: Text(
            '${note.timeNote.day}/${note.timeNote.month}\n${note.timeNote.year}',
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .subtitle1
                ?.copyWith(color: ColorManager.white),
          ),
        ),
        title: Text(
          note.title,
          style: Theme.of(context)
              .textTheme
              .headline4
              ?.copyWith(color: ColorManager.black),
        ),
        subtitle: Text(
          note.note,
          style: Theme.of(context)
              .textTheme
              .subtitle1
              ?.copyWith(color: ColorManager.black),
        ),
        trailing: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(AppPadding.p2),
              child: GestureDetector(
                onTap: () => ViewNotesCubit.cubit(context).deleteNote(note),
                child: CircleAvatar(
                  radius: AppSize.s12,
                  backgroundColor: ColorManager.red,
                  child: Icon(
                    Icons.delete,
                    color: ColorManager.white,
                    size: AppSize.s18,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppPadding.p2),
              child: GestureDetector(
                onTap: () {
                  AddNoteCubit.cubit(context).setToUpdate(note);
                  Navigator.of(context)
                      .pushNamed(Routes.addNoteRoute)
                      .then((value) => ViewNotesCubit.cubit(context).getData());
                },
                child: CircleAvatar(
                  radius: AppSize.s12,
                  backgroundColor: ColorManager.primary,
                  child: Icon(
                    Icons.upload,
                    color: ColorManager.white,
                    size: AppSize.s18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
