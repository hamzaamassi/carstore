class News {
  News({
    this.id,
    this.author,
    this.image,
    this.news,
    this.createdPublish,
    this.relatedNews,
  });

  final int? id;
  final String? author;
  final String? image;
  final String? news;
  final String? createdPublish;
  final int? relatedNews;

  News copyWith({
    int? id,
    String? authorName,
    String? coverImage,
    String? newsContent,
  }) =>
      News(
        id: id ?? this.id,
        author: authorName ?? author,
        image: coverImage ?? image,
        news: newsContent ?? news,
      );

  factory News.fromJson(Map<String, dynamic> json) => News(
        id: json["id"],
        author: json["author_ name"],
        image: json["image"],
        news: json["news"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "auther_name": author,
        "image": image,
        "news": news,
      };

  @override
  String toString() {
    return 'News{id: $id, author: $author,image: $image, news: $news}';
  }
}
