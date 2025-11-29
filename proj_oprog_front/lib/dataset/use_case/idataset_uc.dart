import 'package:proj_oprog_front/dataset/dto/dataset_dto.dart';

abstract class IDatasetUseCase {
  void showDatasetEditUC(int datasetId);
  void saveDatasetUC(DatasetDto dataset);
}

