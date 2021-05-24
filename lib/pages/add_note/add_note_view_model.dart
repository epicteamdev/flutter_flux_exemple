import 'package:redux/redux.dart';

import '../../services/services.dart';
import '../../store/add_note/add_note_actions.dart';
import '../../store/app_state.dart';

class AddNoteViewModel {
  final String title;
  final String? titleError;
  final String text;
  final String? textError;
  final bool saving;
  final String? savingError;

  final void Function(String) onTitleChanged;
  final void Function(String) onTextChanged;
  final void Function() onSave;

  AddNoteViewModel({
    required this.title,
    required this.titleError,
    required this.text,
    required this.textError,
    required this.saving,
    required this.savingError,
    required this.onTitleChanged,
    required this.onTextChanged,
    required this.onSave,
  });

  factory AddNoteViewModel.fromStore(Store<AppState> store) {
    return AddNoteViewModel(
      title: store.state.addNoteState.title,
      titleError: store.state.addNoteState.titleError,
      text: store.state.addNoteState.text,
      textError: store.state.addNoteState.textError,
      saving: store.state.addNoteState.saving,
      savingError: store.state.addNoteState.savingError,
      onTitleChanged: (String title) => store.dispatch(TitleChange(title)),
      onTextChanged: (String text) => store.dispatch(TextChange(text)),
      onSave: () => store.dispatch(saveThunk(Services.notes)),
    );
  }
}
