import 'dart:convert';

class SchemaField {
  String name;
  String type;

  SchemaField({
    required this.name,
    required this.type,
  });
}

String toJsonSchema(List<SchemaField> dtos) {
  final fieldsList = dtos.map((f) => {
    'name': f.name,
    'type': f.type,
  }).toList();
  
  return jsonEncode(fieldsList); 
}
  
List<SchemaField> fromJsonSchema(String jsonSchema) {
  final dynamic decoded = jsonDecode(jsonSchema); 

  final List<SchemaField> fields = [];

  if (decoded is List) {
    for (var item in decoded) {
      fields.add(SchemaField(
        name: item['name'] ?? '',
        type: item['type'] ?? '',
      ));
    }
  }

  return fields;
}

