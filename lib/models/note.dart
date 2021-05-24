class Note {
  final String? id;
  final String title;
  final String text;
  Note({
    this.id,
    required this.title,
    required this.text,
  });

  Map<String, dynamic> toMap() {
    return {
      "title": title,
      "text": text,
    };
  }
}
