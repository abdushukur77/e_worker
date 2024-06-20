class CategoryModel {
  final String id;
  final String name;
  final String image;

  CategoryModel({
    required this.image,
    required this.id,
    required this.name,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      image: json['image'] as String? ?? "",
      id: json['id'] as String? ?? "",
      name: json['name'] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "image":image,
      'id': id,
      'name': name,
    };
  }

  Map<String, dynamic> toJsonForUpdate() {
    return {
      'name': name,
    };
  }

  CategoryModel copyWith({
    String? id,
    String? name,
    String? image
  }) {
    return CategoryModel(
      image: image ?? this.image ,
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  static CategoryModel initial() => CategoryModel(
        id: "",
        name: "",
    image: ""
      );
}
