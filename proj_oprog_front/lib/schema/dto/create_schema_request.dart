class CreateSchemaRequest {
  final String name;
  final String jsonSchema;

  CreateSchemaRequest({required this.name, required this.jsonSchema});
  factory CreateSchemaRequest.fromJson(Map<String, dynamic> json) {
    return CreateSchemaRequest(
      name: json['name'] ?? '',
      jsonSchema: json['jsonSchema'] ?? '',
    );
  }
}
