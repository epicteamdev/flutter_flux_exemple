import 'package:redux/redux.dart';

import '../../models/note.dart';
import '../../services/services.dart';
import '../../store/app_state.dart';
import '../../middlewares/navigation/nagivation_actions.dart';
import '../../store/my_notes/my_notes_actions.dart';

class MyNotesViewModel {
  final List<Note> notes;
  final bool loading;
  final String? loadingError;
  final void Function(Note) removeNote;
  final void Function() navigateToAddNote;

  MyNotesViewModel({
    required this.notes,
    required this.removeNote,
    required this.navigateToAddNote,
    required this.loading,
    this.loadingError,
  });

  factory MyNotesViewModel.fromStore(Store<AppState> store) {
    return MyNotesViewModel(
      notes: store.state.myNotesState.notes,
      loading: store.state.myNotesState.loading,
      loadingError: store.state.myNotesState.loadingError,
      removeNote: (Note note) =>
          store.dispatch(remoteNote(Services.notes, note)),
      navigateToAddNote: () => store.dispatch(NavigateTo("/add_note")),
    );
  }
}
