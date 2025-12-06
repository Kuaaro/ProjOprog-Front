import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../shared/dtos/named_id_pair.dart';
import 'idata_schema.dart';
import '../dto/schema_dto.dart';

class DataSchemaService implements IDataSchema {
  @override
Future<void> editSchema(SchemaDto schema) async {
  
  final response = await http.put(
    Uri.parse('$baseUrl/schemas/${schema.id}'),
    headers: {'Content-Type': 'application/json'},
    body: json.encode(schema.toJson()),
  );
  
  if (response.statusCode != 200) {
    throw Exception('Failed to update: ${response.statusCode}');
  }
}
  final String baseUrl = 'http://localhost:3000';

  DataSchemaService();

  @override
  Future<List<NamedIdPair>> getSchemaList() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/schemas/list'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        final List<dynamic> data = jsonData['schemas'];
        return data.map((item) => NamedIdPair.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load schema list');
      }
    } catch (e) {
      rethrow;
    }
}

  @override
  Future<SchemaDto> getSchema(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/schemas/$id'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return SchemaDto.fromJson(data);
    } else {
      throw Exception('Failed to load schema');
    }
  }



    @override
      Future<void> addSchema(SchemaDto schema) async {
      final response = await http.post(
        Uri.parse('$baseUrl/schemas'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'name': schema.name,
          'jsonSchema': schema.jsonSchema,
        }),
      );
      if (response.statusCode != 201 ) {
        throw Exception('Failed to add schema');
      }
    }
}
