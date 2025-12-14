class CreateCatalogRequest {
  final String name;
  final String description;
  final int parentCatalog;

  CreateCatalogRequest({
    required this.name,
    required this.description,
    required this.parentCatalog,
  });

  factory CreateCatalogRequest.fromJson(Map<String, dynamic> json) {
    return CreateCatalogRequest(
      name: json['name'] as String,
      description: json['description'] as String,
      parentCatalog: json['parent_catalog'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'parent_catalog': parentCatalog,
    };
  }
}
