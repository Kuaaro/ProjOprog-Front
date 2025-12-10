import 'package:http/http.dart' as http;
import 'package:proj_oprog_front/schema/dto/create_schema_request.dart';
import 'package:proj_oprog_front/schema/dto/get_schema_list_response.dart';
import 'package:proj_oprog_front/schema/dto/get_schema_response.dart';
import 'package:proj_oprog_front/schema/dto/modify_schema_request.dart';
import 'dart:convert';
import 'idata_schema.dart';

class DataSchemaService implements IDataSchema {
  final String baseUrl = '/api';

  DataSchemaService();

    @override
    Future<void> editSchema(ModifySchemaRequest schema, int id) async {
      final response = await http.put(
        Uri.parse('$baseUrl/schemas/$id'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'name': schema.name,
          'jsonSchema': schema.jsonSchema,
        }),
      );
      if (response.statusCode != 204) {
        throw Exception('Failed to edit schema');
      }
    }

  @override
  Future<GetSchemaListResponse> getSchemaList() async {
    final response = await http.get(Uri.parse('$baseUrl/schemas/list'));
    if (response.statusCode == 200) {
     final Map<String, dynamic> jsonBody = jsonDecode(response.body);

      return GetSchemaListResponse.fromJson(jsonBody);
    } else {
      throw Exception('Failed to load schema list');
    }
  }

  @override
  Future<GetSchemaResponse> getSchema(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/schemas/$id'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return GetSchemaResponse.fromJson(data);
    } else {
      throw Exception('Failed to load schema');
    }
  }



    @override
      Future<void> addSchema(CreateSchemaRequest schema) async {
      final response = await http.post(
        Uri.parse('$baseUrl/schemas'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'name': schema.name,
          'jsonSchema': schema.jsonSchema,
        }),
      );
      if (response.statusCode != 201) {
        throw Exception('Failed to add schema');
      }
    }
}
