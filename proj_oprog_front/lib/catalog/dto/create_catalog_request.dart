class CreateCatalogRequest {
  final String name;
  final String description;
  final int parentCatalogId;

  CreateCatalogRequest({
    required this.name,
    required this.description,
    required this.parentCatalogId,
  });

  factory CreateCatalogRequest.fromJson(Map<String, dynamic> json) {
    return CreateCatalogRequest(
      name: json['name'] as String,
      description: json['description'] as String,
      parentCatalogId: json['parentCatalogId'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'parentCatalogId': parentCatalogId,
    };
  }
}
