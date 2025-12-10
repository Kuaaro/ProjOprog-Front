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
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? '',
      desc: json['description'] as String? ?? '',
      contactPoint: json['contactPoint'] as String? ?? '',
      keywords: (json['keywords'] as List<dynamic>?)?.map((e) => e as String).toList() ?? [],
      distributions: (json['distributions'] as List<dynamic>?)
          ?.map((e) => DistributionDto.fromJson(e as Map<String, dynamic>))
          .toList() ?? [],
      schemaId: (json['schemaId'] as num?)?.toInt() ?? 0,
    );
  } 
}

