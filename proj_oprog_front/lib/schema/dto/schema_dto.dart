class SchemaDto {
  final String? id;
  final String name;
  final String jsonSchema;

  SchemaDto({this.id, required this.name, required this.jsonSchema});
  factory SchemaDto.fromJson(Map<String, dynamic> json) {
    return SchemaDto(
      id: json['id']?.toString(),
      name: json['name'] ?? '',
      jsonSchema: json['jsonSchema'] ?? '',
    );
  }
   Map<String, dynamic> toJson() => {
    if (id != null) 'id': id,
    'name': name,
    'jsonSchema': jsonSchema,
  };
}
