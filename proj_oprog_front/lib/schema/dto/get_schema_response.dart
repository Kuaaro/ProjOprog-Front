class GetSchemaResponse {
  final String name;
  final String jsonSchema;

  GetSchemaResponse({required this.name, required this.jsonSchema});
  factory GetSchemaResponse.fromJson(Map<String, dynamic> json) {
    return GetSchemaResponse(
      name: json['name'] ?? '',
      jsonSchema: json['jsonSchema'] ?? '',
    );
  }
}
