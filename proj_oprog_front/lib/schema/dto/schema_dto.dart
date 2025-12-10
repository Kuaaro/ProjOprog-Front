class SchemaDto {
  final String name;
  final String jsonSchema;

  SchemaDto({required this.name, required this.jsonSchema});
  factory SchemaDto.fromJson(Map<String, dynamic> json) {
    return SchemaDto(
      name: json['name'] ?? '',
      jsonSchema: json['jsonSchema'] ?? '',
    );
  }
}
