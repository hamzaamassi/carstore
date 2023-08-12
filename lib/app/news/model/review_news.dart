class ReviewNews {
  ReviewNews({
    this.id,
    this.author,
    this.image,
    this.news,
    this.createdPublish,
    this.countLike,
    this.countReply,
    this.isLike = false
  });

  final int? id;
  final String? author;
  final String? image;
  final String? news;
  final String? createdPublish;
  final int? countReply;
  final int? countLike;
  late final bool? isLike;

  ReviewNews copyWith({
    int? id,
    String? authorName,
    String? coverImage,
    String? newsContent,
  }) =>
      ReviewNews(
        id: id ?? this.id,
        author: authorName ?? author,
        image: coverImage ?? image,
        news: newsContent ?? news,
      );

  factory ReviewNews.fromJson(Map<String, dynamic> json) => ReviewNews(
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
