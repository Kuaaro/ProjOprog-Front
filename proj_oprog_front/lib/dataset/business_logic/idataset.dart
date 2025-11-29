import 'package:proj_oprog_front/dataset/dto/dataset_dto.dart';
import 'package:proj_oprog_front/dataset/dto/modify_dataset_request.dart';

abstract class IDataset {
  Future<DatasetDto> getDataset(int id);
  Future<void> modifyDataset(int id, ModifyDatasetRequest request);
}

