class CreateCatalogResponse {
  final int id;

  CreateCatalogResponse({required this.id});

  factory CreateCatalogResponse.fromJson(Map<String, dynamic> json) {
    return CreateCatalogResponse(id: json['id'] as int);
  }

  Map<String, dynamic> toJson() {
    return {'id': id};
  }
}
