import 'package:redux/redux.dart';

import '../../models/note.dart';
import '../../models/note_service.dart';
import '../app_state.dart';

class LoadingAction {
  final bool loading;
  final String? loadingError;
  LoadingAction({
    required this.loading,
    this.loadingError,
  });
}

class UpdateNotes {
  final List<Note> notes;
  UpdateNotes(this.notes);
}

void Function(Store<AppState>) loadNotes(NoteService noteService) {
  return (Store<AppState> store) {
    store.dispatch(LoadingAction(
      loading: true,
      loadingError: null,
    ));
    noteService.all().listen((notes) {
      store.dispatch(LoadingAction(
        loading: false,
        loadingError: null,
      ));
      store.dispatch(UpdateNotes(notes));
    });
  };
}

void Function(Store<AppState>) remoteNote(NoteService noteService, note) {
  return (Store<AppState> store) {
    store.dispatch(LoadingAction(
      loading: true,
      loadingError: null,
    ));
    noteService.remove(note).then((value) {
      store.dispatch(LoadingAction(
        loading: false,
        loadingError: null,
      ));
    }).onError((error, stackTrace) {
      store.dispatch(LoadingAction(
        loading: false,
        loadingError: error.toString(),
      ));
    });
  };
}
