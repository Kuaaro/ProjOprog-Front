import 'package:proj_oprog_front/dataset/dto/distribution_dto.dart';

class CreateDatasetRequest {
  String name;
  String description;
  String contactPoint;
  List<String> keywords;
  List<DistributionDto> distributions;
  int schemaId;
  int parentId;

  CreateDatasetRequest({
    required this.name,
    required this.description,
    required this.contactPoint,
    required this.keywords,
    required this.distributions,
    required this.schemaId,
    required this.parentId,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'contactPoint': contactPoint,
      'keywords': keywords,
      'distributions': distributions.map((e) => e.toJson()).toList(),
      'schemaId': schemaId,
      'parentId': parentId,
    };
  }
}


