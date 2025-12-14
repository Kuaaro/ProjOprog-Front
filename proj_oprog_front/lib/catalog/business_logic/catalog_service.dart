import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proj_oprog_front/catalog/dto/create_catalog_request.dart';
import 'package:proj_oprog_front/catalog/dto/create_catalog_response.dart';
import 'package:proj_oprog_front/catalog/dto/get_catalog_children_response.dart';
import 'package:proj_oprog_front/catalog/business_logic/icatalog.dart';

class CatalogService implements ICatalog {
  // final String baseUrl = '/api';
  final String baseUrl = 'http://localhost:3000';

  @override
  Future<GetCatalogChildrenResponse> getCatalogChildren(int id) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/catalogs/children/$id'),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        return GetCatalogChildrenResponse.fromJson(data);
      } else {
        throw Exception('Failed to load catalog children');
      }
    } catch (e) {
      throw Exception('Error fetching catalog children: $e');
    }
  }

  @override
  Future<CreateCatalogResponse> createCatalog(
    CreateCatalogRequest request,
  ) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/catalogs'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(request.toJson()),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        return CreateCatalogResponse.fromJson(data);
      } else {
        throw Exception('Failed to create catalog');
      }
    } catch (e) {
      throw Exception('Error creating catalog: $e');
    }
  }
}
