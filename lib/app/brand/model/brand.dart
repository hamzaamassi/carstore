class Brand {
  final int id;
  final String name;
  final String logo;

  Brand({
    required this.id,
    required this.name,
    required this.logo,
  });

  Brand copyWith({
    int? id,
    String? name,
    String? logo,
  }) =>
      Brand(
        id: id ?? this.id,
        name: name ?? this.name,
        logo: logo ?? this.logo,
      );


  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
    id: json["id"],
    name: json["name"],
    logo: json["logo"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "logo": logo,
  };
}