import 'package:proj_oprog_front/metadata_manager/data/model/dtos/dataset_dto.dart';

abstract class IDataset {
  DatasetDto getDataset(int id);
  void createDataset(DatasetDto dto);
  void modifyDataset(int id, DatasetDto dto);
}