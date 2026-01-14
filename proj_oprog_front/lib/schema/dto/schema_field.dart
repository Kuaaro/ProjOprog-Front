import 'dart:convert';

enum SchemaFieldType {
  int('integer', 'integer'),
  float('number', 'float'),
  string('string', 'string'),
  date('string', 'date');

  final String value;
  final String displayName;
  const SchemaFieldType(this.value, this.displayName);

  static SchemaFieldType fromString(String value) {
    return SchemaFieldType.values.firstWhere(
      (type) => type.value == value,
      orElse: () => SchemaFieldType.string,
    );
  }
}

class SchemaField {
  String name;
  SchemaFieldType type;

  SchemaField({
    required this.name,
    required this.type,
  });
}

String toJsonSchema(List<SchemaField> fields) {
  if (fields.isEmpty) {
    return jsonEncode({
      '\$schema': 'https://json-schema.org/draft/2020-12/schema',
      'type': 'object',
      'properties': {},
      'required': [],
      'additionalProperties': false,
    });
  }

  final properties = <String, dynamic>{};
  final required = <String>[];

  for (var field in fields) {
    if (field.name.isNotEmpty) {
      properties[field.name] = {
        'type': field.type.value,
      };
      required.add(field.name);
    }
  }

  final schema = {
    '\$schema': 'https://json-schema.org/draft/2020-12/schema',
    'type': 'object',
    'properties': properties,
    'required': required,
    'additionalProperties': false,
  };

  return jsonEncode(schema);
}

List<SchemaField> fromJsonSchema(String jsonSchema) {
  final dynamic decoded = jsonDecode(jsonSchema);
  final List<SchemaField> fields = [];

  if (decoded is Map<String, dynamic>) {
    final properties = decoded['properties'] as Map<String, dynamic>?;
    if (properties != null) {
      properties.forEach((fieldName, fieldDef) {
        if (fieldDef is Map<String, dynamic>) {
          final typeString = fieldDef['type'] as String? ?? 'string';
          fields.add(SchemaField(
            name: fieldName,
            type: SchemaFieldType.fromString(typeString),
          ));
        }
      });
    }
  } else if (decoded is List) {
    // Fallback for old format
    for (var item in decoded) {
      fields.add(SchemaField(
        name: item['name'] ?? '',
        type: SchemaFieldType.fromString(item['type'] ?? 'string'),
      ));
    }
  }

  return fields;
}

