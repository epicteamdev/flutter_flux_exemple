import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../components/loading.dart';
import '../../services/services.dart';
import '../../store/app_state.dart';
import '../../store/my_notes/my_notes_actions.dart';
import 'my_notes_view_model.dart';
import 'style.dart';

class MyNotes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, MyNotesViewModel>(
      onInit: (store) {
        store.dispatch(loadNotes(Services.notes));
      },
      converter: (store) => MyNotesViewModel.fromStore(store),
      builder: (context, viewModel) {
        return Scaffold(
          appBar: AppBar(
            title: Text("My Notes"),
            centerTitle: true,
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: viewModel.navigateToAddNote,
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          body: viewModel.loading
              ? Loading()
              : ListView(
                  children: [
                    ...viewModel.notes.map((note) => NoteItem(
                          note: note,
                          onDelete: () => viewModel.removeNote(note),
                        )),
                  ],
                ),
        );
      },
    );
  }
}
