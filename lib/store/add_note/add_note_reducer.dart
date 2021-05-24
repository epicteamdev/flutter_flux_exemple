import 'add_note_actions.dart';
import 'add_note_state.dart';

AddNoteState addNoteReducer(AddNoteState state, dynamic action) {
  if (action is Saving) {
    return state.copyWith(
      saving: action.saving,
      savingError: action.savingError,
    );
  } else if (action is TitleChange) {
    return state.copyWith(
      title: action.title,
    );
  } else if (action is TextChange) {
    return state.copyWith(
      text: action.text,
    );
  } else if (action is ClearFormData) {
    return AddNoteState.initial();
  }
  return state;
}
