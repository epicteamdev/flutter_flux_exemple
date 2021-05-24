import 'package:flutter/foundation.dart';

@immutable
class AddNoteState {
  final String title;
  final String? titleError;

  final String text;
  final String? textError;

  final bool saving;
  final String? savingError;

  AddNoteState({
    required this.title,
    this.titleError,
    required this.text,
    this.textError,
    required this.saving,
    this.savingError,
  });

  factory AddNoteState.initial() {
    return AddNoteState(
      saving: false,
      text: "",
      title: "",
    );
  }

  copyWith({
    String? title,
    String? titleError,
    String? text,
    String? textError,
    bool? saving,
    String? savingError,
  }) {
    return AddNoteState(
      title: title != null ? title : this.title,
      titleError: titleError != null ? titleError : this.titleError,
      text: text != null ? text : this.text,
      textError: textError != null ? textError : this.textError,
      saving: saving != null ? saving : this.saving,
      savingError: savingError != null ? savingError : this.savingError,
    );
  }
}
