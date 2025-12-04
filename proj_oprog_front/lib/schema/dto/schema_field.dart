import 'dart:convert';

class SchemaField {
  String name;
  String type;
  String count;

  SchemaField({
    required this.name,
    required this.type,
    required this.count,
  });
}

String toJsonSchema(List<SchemaField> dtos) {
    final fieldsList = dtos.map((f) => {
      'name': f.name,
      'type': f.type,
      'count': f.count,
    }).toList();
    return fieldsList.toString();
  }
  
List<SchemaField> fromJsonSchema(String jsonSchema) {
  final dynamic decoded = jsonDecode(jsonSchema); 

  final List<SchemaField> fields = [];

  if (decoded is List) {
    for (var item in decoded) {
      fields.add(SchemaField(
        name: item['name'] ?? '',
        type: item['type'] ?? '',
        count: item['count'] ?? '', 
      ));
    }
  }

  return fields;
}

