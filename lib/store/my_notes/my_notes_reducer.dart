import 'my_notes_state.dart';
import 'my_notes_actions.dart';

MyNotesState myNotesReducer(MyNotesState state, dynamic action) {
  if (action is LoadingAction) {
    return state.copyWith(
      loading: action.loading,
      loadingError: action.loadingError,
    );
  } else if (action is UpdateNotes) {
    return state.copyWith(
      notes: action.notes,
    );
  }
  return state;
}
