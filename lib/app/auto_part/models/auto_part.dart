class AutoPart {
  AutoPart({
    this.id,
    this.name,
    this.price,
    this.image,
    this.favorite,
    this.opacityTitle,
  });

  final int? id;
  final String? name;
  final String? image;
  final String? price;
  late final bool? favorite;
  late final String? opacityTitle;

  AutoPart copyWith({
    int? id,
    String? carName,
    String? carPrice,
    String? coverImage,
    bool? isFavorite,
    String? opacityTitleText,
  }) =>
      AutoPart(
        id: id ?? this.id,
        name: carName ?? name,
        price: carPrice ?? price,
        image: coverImage ?? image,
        favorite: isFavorite ?? favorite,
        opacityTitle: opacityTitleText ?? opacityTitle,
      );

  factory AutoPart.fromJson(Map<String, dynamic> json) => AutoPart(
    id: json["id"],
    name: json["car_ name"],
    price: json["car_ price"],
    image: json["image"],
    favorite: json["favorite"],
    opacityTitle: json["opacity_title"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "car_name": name,
    "car_price": price,
    "image": image,
    "favorite": favorite,
    "opacity_title": opacityTitle,
  };

  @override
  String toString() {
    return 'Agent{id: $id, name: $name,prie: $price, image: $image,favorite: $favorite,opacityText: $opacityTitle}';
  }
}
