import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/app/injection_container.dart';
import 'package:todo/core/error/failures.dart';
import 'package:todo/core/resources/strings_manager.dart';
import 'package:todo/modules/todo/data/models/todo_model.dart';
import 'package:todo/modules/todo/domain/entities/todo.dart';
import 'package:todo/modules/todo/domain/usecases/add_note_case.dart';
import 'package:todo/modules/todo/domain/usecases/upate_note_case.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  bool update = false;
  int id = 0;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController noteTxt = TextEditingController();
  final TextEditingController noteTitle = TextEditingController();
  late DateTime? _noteTime;

  final AddNoteCase addNoteCase = sl();
  final UpdateNoteCase updateNoteCase = sl();

  late Note updateNote;

  static AddNoteCubit cubit(BuildContext context) => BlocProvider.of(context);

  void setToUpdate(Note note) {
    update = true;

    noteTitle.text = note.title;
    noteTxt.text = note.note;
    _noteTime = note.timeNote;

    updateNote = note;
  }

  String? validatorTitle(String? value) {
    if (value == null) {
      return AppStrings.noteMsg;
    }
    return null;
  }

  String? validatorNote(String? value) {
    if (value == null) {
      return AppStrings.titleMsg;
    }
    return null;
  }

  Future<void> saveNote() async {
    if (formKey.currentState?.validate() ?? false) {
      if (update) {
        final noteAdd = NotesModel(
          id: updateNote.id,
          note: noteTxt.text,
          title: noteTitle.text,
          timeNote: _noteTime ?? DateTime.now(),
        );

        final res = await updateNoteCase(noteAdd);

        print('res : $res');

        res.fold(
          (failure) => emit(NoteSavedErrorState(failure: failure)),
          (not) {
            update = false;
            noteTitle.clear();
            noteTxt.clear();
            _noteTime = DateTime.now();
            emit(NoteSavedDoneState());
          },
        );
      } else {
        final noteAdd = NotesModel(
          note: noteTxt.text,
          title: noteTitle.text,
          timeNote: _noteTime ?? DateTime.now(),
        );

        final res = await addNoteCase(noteAdd);

        print('res : $res');

        res.fold(
          (failure) => emit(NoteSavedErrorState(failure: failure)),
          (not) {
            noteTitle.clear();
            noteTxt.clear();
            _noteTime = DateTime.now();
            emit(NoteSavedDoneState());
          },
        );
      }
    }
  }

  void noteTimeFun(DateTime? p1) {
    print('date $p1');
    _noteTime = p1;
  }
}
