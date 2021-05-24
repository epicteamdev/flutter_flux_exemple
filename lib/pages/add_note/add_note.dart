import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../components/loading.dart';
import '../../store/app_state.dart';
import 'add_note_view_model.dart';
import 'styles.dart';

class AddNote extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AddNoteViewModel>(
      converter: (store) => AddNoteViewModel.fromStore(store),
      builder: (context, viewModel) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Add Note"),
            centerTitle: true,
          ),
          body: viewModel.saving
              ? Loading()
              : ListView(
                  children: [
                    Error(viewModel.savingError),
                    TextInput(
                      title: "Title",
                      onChanged: viewModel.onTitleChanged,
                    ),
                    TextInput(
                      title: "Text",
                      onChanged: viewModel.onTextChanged,
                    ),
                    ElevatedButton(
                      onPressed: viewModel.onSave,
                      child: Icon(Icons.add),
                    ),
                  ],
                ),
        );
      },
    );
  }
}
