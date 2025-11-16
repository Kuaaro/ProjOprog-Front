import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proj_oprog_front/metadata_manager/data/model/dtos/catalog_dto.dart';
import 'package:proj_oprog_front/metadata_manager/data/model/dtos/get_catalog_children_response.dart';
import 'package:proj_oprog_front/metadata_manager/data/services/icatalog.dart';

class CatalogService implements ICatalog {
  final String baseUrl;

  CatalogService({this.baseUrl = 'http://localhost:3000'});

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
  Future<void> createCatalog(CatalogDto dto) async {
    // TODO: implement later
  }
}
