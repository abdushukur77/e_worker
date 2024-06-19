class SubCategoryModel {
  final String id;
  final String parentId;
  final String name;

  SubCategoryModel({
    required this.id,
    required this.name,
    required this.parentId,
  });

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) {
    return SubCategoryModel(
      id: json['id'] as String? ?? "",
      parentId: json['parentId'] as String? ?? "",
      name: json['name'] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'parentId': parentId,
    };
  }

  Map<String, dynamic> toJsonForUpdate() {
    return {
      'name': name,
      'parentId': parentId,
    };
  }

  SubCategoryModel copyWith({
    String? id,
    String? name,
    String? parentId,
  }) {
    return SubCategoryModel(
      id: id ?? this.id,
      name: name ?? this.name,
      parentId: parentId ?? this.parentId,
    );
  }

  static SubCategoryModel initial() => SubCategoryModel(
        id: "",
        name: "",
        parentId: "",
      );
}
