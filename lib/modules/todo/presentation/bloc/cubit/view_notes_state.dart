part of 'view_notes_cubit.dart';

abstract class ViewNotesState {
  const ViewNotesState();
}

class ViewNotesInitial extends ViewNotesState {}

class ViewNotesLoadingState extends ViewNotesState {}

class ViewNotesErrorState extends ViewNotesState {}

class DeleteNotesErrorState extends ViewNotesState {}

class ViewNotesDoneState extends ViewNotesState {
  ViewNotesDoneState({
    required this.data,
  });
  final List<Note> data;
}
