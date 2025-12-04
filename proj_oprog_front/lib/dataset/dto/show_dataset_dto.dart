import 'package:proj_oprog_front/dataset/dto/dataset_dto.dart';

class ShowDatasetDto {
  final DatasetDto dataset;

  ShowDatasetDto({required this.dataset});

  factory ShowDatasetDto.fromJson(Map<String, dynamic> json) {
    return ShowDatasetDto(
      dataset: DatasetDto.fromJson(json),
    );
  }
}

