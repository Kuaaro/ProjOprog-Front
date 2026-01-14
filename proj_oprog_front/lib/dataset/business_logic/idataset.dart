import 'package:proj_oprog_front/dataset/dto/dataset_dto.dart';
import 'package:proj_oprog_front/dataset/dto/modify_dataset_request.dart';
import 'package:proj_oprog_front/dataset/dto/create_dataset_request.dart';

abstract class IDataset {
  Future<DatasetDto> getDataset(int id);
  Future<int> createDataset(CreateDatasetRequest request);
  Future<void> modifyDataset(int id, ModifyDatasetRequest request);
  Future<List<dynamic>> getDatasetData(int id); 
}

