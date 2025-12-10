import 'package:proj_oprog_front/dataset/dto/dataset_dto.dart';
import 'package:proj_oprog_front/dataset/dto/create_dataset_request.dart';

abstract class IDatasetUseCase {
  void showDatasetCreateUC(int? parentCatalogId);
  void showDatasetEditUC(int datasetId);
  void createDatasetUC(CreateDatasetRequest request);
  void saveDatasetUC(DatasetDto dataset);
}

