part of 'add_note_cubit.dart';

abstract class AddNoteState {
  const AddNoteState();
}

class AddNoteInitial extends AddNoteState {}

class NoteSavedDoneState extends AddNoteState {}

class NoteSavedErrorState extends AddNoteState {
  NoteSavedErrorState({
    required this.failure,
  });
  final Failure failure;
}
