class Note {
  int? id;
  final String content;
  final String category;

  Note({this.id, required this.content, required this.category});
  
  /*
    زينب يوسف احمد
  */
  
  Map<String, dynamic> toMap() {
    return {'id': id, 'content': content, 'category': category};
  }

  /*
      رنيم وائل الجندي
  */
 
  @override
  String toString() {
    return 'Note (id:$id,content:$content,category:$category)';
  }
}
