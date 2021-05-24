import 'add_note/add_note_reducer.dart';
import 'app_state.dart';
import 'my_notes/my_notes_reducer.dart';

AppState appReducer(AppState state, dynamic action) {
  return AppState(
    myNotesState: myNotesReducer(state.myNotesState, action),
    addNoteState: addNoteReducer(state.addNoteState, action),
  );
}
