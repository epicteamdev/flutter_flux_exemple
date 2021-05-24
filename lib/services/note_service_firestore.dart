import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/note.dart';
import '../models/note_service.dart';

final notesCollection = FirebaseFirestore.instance.collection('notes');

Note fromDocumentSnapshot(DocumentSnapshot doc) {
  final data = doc.data();
  if (data == null || !(data is Map)) throw "DocumentSnapshot data error!";
  return Note(
    id: doc.id,
    title: data['title'],
    text: data['text'],
  );
}

class NoteServiceFirestore extends NoteService {
  @override
  Future<Note> add(Note note) async {
    final noteReference = await notesCollection.add(note.toMap());
    final noteData = await noteReference.get();
    final newNote = fromDocumentSnapshot(noteData);
    return newNote;
  }

  @override
  Stream<List<Note>> all() {
    return notesCollection.snapshots().map(
        (query) => query.docs.map((doc) => fromDocumentSnapshot(doc)).toList());
  }

  @override
  Future<void> remove(Note note) async {
    final ref = notesCollection.doc(note.id);
    return ref.delete();
  }
}
