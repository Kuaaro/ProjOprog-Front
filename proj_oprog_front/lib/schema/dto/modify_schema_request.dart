class ModifySchemaRequest {
  final String name;
  final String jsonSchema;

  ModifySchemaRequest({required this.name, required this.jsonSchema});
  factory ModifySchemaRequest.fromJson(Map<String, dynamic> json) {
    return ModifySchemaRequest(
      name: json['name'] ?? '',
      jsonSchema: json['jsonSchema'] ?? '',
    );
  }
}
