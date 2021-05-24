import 'note.dart';

abstract class NoteService {
  Stream<List<Note>> all();
  Future<Note> add(Note note);
  Future<void> remove(Note note);
}
