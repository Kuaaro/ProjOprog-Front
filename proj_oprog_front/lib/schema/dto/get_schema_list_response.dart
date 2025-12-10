import 'package:proj_oprog_front/shared/dtos/named_id_pair.dart';

class GetSchemaListResponse {
  final List<NamedIdPair> schemas;

  GetSchemaListResponse({required this.schemas});

  factory GetSchemaListResponse.fromJson(Map<String, dynamic> json) {
    List<NamedIdPair> schemasList = [];

    if (json['schemas'] != null && json['schemas'] is List) {
      schemasList = (json['schemas'] as List)
          .map<NamedIdPair>((item) => NamedIdPair.fromJson(item))
          .toList();
    }

    return GetSchemaListResponse(schemas: schemasList);
  }
}