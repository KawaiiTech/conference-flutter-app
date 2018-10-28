class Talk {
  final String time;
  final String title;
  final String author;

  const Talk({
    this.time,
    this.title,
    this.author,
  }) : assert(title != null);

  @override
  String toString() {
    return 'Talk{time: $time, title: $title, author: $author}';
  }


}
