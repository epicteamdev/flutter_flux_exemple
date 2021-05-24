import 'package:flutter/material.dart';

import '../../components/mouse_hover_icon.dart';
import '../../models/note.dart';

class NoteItem extends StatelessWidget {
  final Note note;
  final void Function() onDelete;

  NoteItem({
    required this.note,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(note.title),
      subtitle: Text(note.text),
      trailing: GestureDetector(
        child: MouseHoveIcon(
          icon: Icons.delete,
          hoveringIcon: Icons.delete_outline,
        ),
        onTap: onDelete,
      ),
    );
  }
}
