import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../shared/dtos/named_id_pair.dart';
import 'idata_schema.dart';
import '../dto/schema_dto.dart';

class DataSchemaService implements IDataSchema {
  @override
    Future<void> editSchema(SchemaDto schema) async {
      final response = await http.put(
        Uri.parse('$baseUrl/schema/${schema.id}'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'id': schema.id,
          'name': schema.name,
          'jsonSchema': schema.jsonSchema,
        }),
      );
      if (response.statusCode != 200) {
        throw Exception('Failed to edit schema');
      }
    }
  final String baseUrl = 'http://localhost:3000';

  DataSchemaService();

  @override
  Future<List<NamedIdPair>> getSchemaList() async {
    final response = await http.get(Uri.parse('$baseUrl/schema/list'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((item) => NamedIdPair.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load schema list');
    }
  }

  @override
  Future<SchemaDto> getSchema(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/schema/$id'));
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
        Uri.parse('$baseUrl/schema/add'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'name': schema.name,
          'jsonSchema': schema.jsonSchema,
        }),
      );
      if (response.statusCode != 200) {
        throw Exception('Failed to add schema');
      }
    }
}
