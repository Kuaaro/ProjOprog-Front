import 'package:proj_oprog_front/dataset/dto/distribution_dto.dart';
import 'package:proj_oprog_front/dataset/dto/dataset_dto.dart';

class ModifyDatasetRequest {
  String name;
  String desc;
  String contactPoint;
  List<String> keywords;
  List<DistributionDto> distributions;
  int schemaId;

  ModifyDatasetRequest({
    required this.name,
    required this.desc,
    required this.contactPoint,
    required this.keywords,
    required this.distributions,
    required this.schemaId,
  });
 
  factory ModifyDatasetRequest.fromDatasetDto(DatasetDto dto) {
    return ModifyDatasetRequest(
      name: dto.name,
      desc: dto.desc,
      contactPoint: dto.contactPoint,
      keywords: dto.keywords,
      distributions: dto.distributions,
      schemaId: dto.schemaId,
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'desc': desc,
      'contact_point': contactPoint,
      'keywords': keywords,
      'distributions': distributions.map((e) => e.toJson()).toList(),
      'schema_id': schemaId,
    };
  }
}

