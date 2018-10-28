class Talk {
  final String time;
  final String title;
  final String author;

  const Talk({
    this.time,
    this.title,
    this.author,
  }) : assert(title != null, author != null);
}
