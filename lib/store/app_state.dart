import 'add_note/add_note_state.dart';
import 'my_notes/my_notes_state.dart';

class AppState {
  final MyNotesState myNotesState;
  final AddNoteState addNoteState;

  AppState({
    required this.myNotesState,
    required this.addNoteState,
  });

  factory AppState.inital() {
    return AppState(
      myNotesState: MyNotesState.initial(),
      addNoteState: AddNoteState.initial(),
    );
  }
}
