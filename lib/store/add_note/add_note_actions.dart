import 'package:redux/redux.dart';

import '../../models/note.dart';
import '../../models/note_service.dart';
import '../app_state.dart';
import '../../middlewares/navigation/nagivation_actions.dart';

class TitleChange {
  final String title;
  TitleChange(this.title);
}

class TextChange {
  final String text;
  TextChange(this.text);
}

class ClearFormData {}

class Saving {
  final bool saving;
  final String? savingError;
  Saving({
    required this.saving,
    this.savingError,
  });
}

void Function(Store<AppState>) saveThunk(NoteService noteService) {
  return (Store<AppState> store) {
    store.dispatch(Saving(saving: true));

    final note = Note(
      title: store.state.addNoteState.title,
      text: store.state.addNoteState.text,
    );
    noteService.add(note).then((newNote) {
      store.dispatch(ClearFormData());
      store.dispatch(Saving(saving: false));
      store.dispatch(NavigateBack());
    }).onError((error, stackTrace) {
      store.dispatch(Saving(
        saving: false,
        savingError: error.toString(),
      ));
    });
  };
}
