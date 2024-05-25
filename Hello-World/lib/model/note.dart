class Note {
  int? id;
  final String content;
  final String category;

  Note({this.id, required this.content, required this.category});
  /*
    زينب احمد
  */
  Map<String, dynamic> toMap() {
    return {'id': id, 'content': content, 'category': category};
  }

  /*
      رنيم الجندي
  */
  @override
  String toString() {
    return 'Note (id:$id,content:$content,category:$category)';
  }
}
