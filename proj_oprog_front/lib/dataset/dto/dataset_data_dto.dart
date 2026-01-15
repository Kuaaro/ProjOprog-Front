import 'package:proj_oprog_front/dataset/dto/dataset_dto.dart';

class DatasetDataDto {
  int id;
  int datasetId;
  DatasetDto dataSet;
  String data;

  DatasetDataDto({
    required this.id,
    required this.datasetId,
    required this.dataSet,
    required this.data,
  });

  factory DatasetDataDto.fromJson(Map<String, dynamic> json) {
    return DatasetDataDto(
      id: (json['id'] as num?)?.toInt() ?? 0,
      datasetId: (json['datasetId'] as num?)?.toInt() ?? 0,
      dataSet: DatasetDto.fromJson(json['dataSet'] as Map<String, dynamic>? ?? {}),
      data: json['data'] as String? ?? '',
    );
  }
}