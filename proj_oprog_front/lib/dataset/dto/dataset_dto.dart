import 'package:proj_oprog_front/dataset/dto/distribution_dto.dart';
 
class DatasetDto {
  int id;
  String name;
  String desc;
  String contactPoint;
  List<String> keywords;
  List<DistributionDto> distributions;
  int schemaId;

  DatasetDto({
    required this.id,
    required this.name,
    required this.desc,
    required this.contactPoint,
    required this.keywords,
    required this.distributions,
    required this.schemaId,
  });

  factory DatasetDto.fromJson(Map<String, dynamic> json) {
    return DatasetDto(
      id: json['id'] as int,
      name: json['name'] as String,
      desc: json['desc'] as String,
      contactPoint: json['contact_point'] as String,
      keywords: (json['keywords'] as List<dynamic>).map((e) => e as String).toList(),
      distributions: (json['distributions'] as List<dynamic>)
          .map((e) => DistributionDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      schemaId: json['schema_id'] as int,
    );
  } 
}

