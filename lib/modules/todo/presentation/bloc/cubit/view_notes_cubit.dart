import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/app/injection_container.dart';
import 'package:todo/core/domain/usecases/use_case.dart';
import 'package:todo/modules/todo/domain/entities/todo.dart';
import 'package:todo/modules/todo/domain/usecases/delete_note_case.dart';
import 'package:todo/modules/todo/domain/usecases/select_notes_case.dart';

part 'view_notes_state.dart';

class ViewNotesCubit extends Cubit<ViewNotesState> {
  ViewNotesCubit() : super(ViewNotesInitial());

  static ViewNotesCubit cubit(BuildContext context) => BlocProvider.of(context);

  final SelectAllNotesCase selectAllNotesCase = sl();
  final DeleteNoteCase deleteNoteCase = sl();

  Future getData() async {
    emit(ViewNotesLoadingState());
    final res = await selectAllNotesCase(NoParams());

    res.fold(
      (failure) => emit(ViewNotesErrorState()),
      (notes) {
        emit(ViewNotesDoneState(data: notes));
      },
    );
  }

  Future deleteNote(Note note) async {
    final res = await deleteNoteCase(note);
    res.fold(
      (failure) => emit(DeleteNotesErrorState()),
      (notes) {
        getData();
      },
    );
  }
}
