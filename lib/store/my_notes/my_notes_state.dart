import 'package:flutter/foundation.dart';

import '../../models/note.dart';

@immutable
class MyNotesState {
  final List<Note> notes;
  final bool loading;
  final String? loadingError;

  MyNotesState({
    required this.notes,
    required this.loading,
    this.loadingError,
  });

  factory MyNotesState.initial() {
    return MyNotesState(
      notes: [],
      loading: false,
    );
  }

  MyNotesState copyWith({
    List<Note>? notes,
    bool? loading,
    String? loadingError,
  }) {
    return MyNotesState(
      notes: notes != null ? notes : this.notes,
      loading: loading != null ? loading : this.loading,
      loadingError: loadingError != null ? loadingError : this.loadingError,
    );
  }
}
