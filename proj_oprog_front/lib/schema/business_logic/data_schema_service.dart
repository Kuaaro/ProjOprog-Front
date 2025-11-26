import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../shared/dtos/named_id_pair.dart';
import 'idata_schema.dart';

class DataSchemaService implements IDataSchema {
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
}
