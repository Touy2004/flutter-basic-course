class Book {
  String title;
  String subtitle;
  String thumbnail;
  String previewLink;

  Book({
    required this.title,
    required this.subtitle,
    required this.thumbnail,
    required this.previewLink,
  });
  factory Book.fromJson(Map<String, dynamic> volumeInfo){
    return Book(
      title: volumeInfo['title'] ?? '',
      subtitle: volumeInfo['subtitle'] ?? '',
      thumbnail: volumeInfo['imageLinks']?['thumbnail'] ?? 'https://i.ibb.co/2ypYwdr/no-image.png',
      previewLink: volumeInfo['previewLink'] ?? '',
    );
  }
}
