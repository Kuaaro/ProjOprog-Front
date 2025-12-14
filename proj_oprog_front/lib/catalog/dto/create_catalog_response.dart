class CreateCatalogResponse {
  final int catalogId;

  CreateCatalogResponse({required this.catalogId});

  factory CreateCatalogResponse.fromJson(Map<String, dynamic> json) {
    return CreateCatalogResponse(catalogId: json['catalog_id'] as int);
  }

  Map<String, dynamic> toJson() {
    return {'catalog_id': catalogId};
  }
}
