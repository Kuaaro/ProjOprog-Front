import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proj_oprog_front/dataset/dto/dataset_dto.dart';
import 'package:proj_oprog_front/dataset/dto/modify_dataset_request.dart';
import 'package:proj_oprog_front/dataset/business_logic/idataset.dart';

class DatasetService implements IDataset {
  final String baseUrl = '/api';

  @override
  Future<DatasetDto> getDataset(int id) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/datasets/$id'),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        return DatasetDto.fromJson(data);
      } else {
        throw Exception('Failed to load dataset');
      }
    } catch (e) {
      throw Exception('Error fetching dataset: $e');
    }
  }

   

  @override
  Future<void> modifyDataset(int id, ModifyDatasetRequest request) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/datasets/$id'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(request.toJson()),
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to update dataset');
      }
    } catch (e) {
      throw Exception('Error updating dataset: $e');
    }
  }
}

