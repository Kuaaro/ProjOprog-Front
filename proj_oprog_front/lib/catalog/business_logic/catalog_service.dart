import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proj_oprog_front/catalog/dto/catalog_dto.dart';
import 'package:proj_oprog_front/catalog/dto/show_catalog_dto.dart';
import 'package:proj_oprog_front/catalog/business_logic/icatalog.dart';

class CatalogService implements ICatalog {
  final String baseUrl = '/api';

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
  //   try {
  //     final response = await http.post(
  //       Uri.parse('$baseUrl/catalogs'),
  //     );

  //     if (response.statusCode == 201) {
  //       return;
  //     } else {
  //       throw Exception('Failed to load catalog children');
  //     }
  //   } catch (e) {
  //     throw Exception('Error fetching catalog children: $e');
  //   }
    return;
  }
}
