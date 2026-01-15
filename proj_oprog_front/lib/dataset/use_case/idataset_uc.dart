import 'package:proj_oprog_front/dataset/dto/dataset_dto.dart';
import 'package:proj_oprog_front/shared/dtos/named_id_pair.dart';
import 'package:proj_oprog_front/dataset/dto/create_dataset_request.dart';

abstract class IDatasetUseCase {
  void showDatasetCreateUC(int? parentCatalogId);
  void showDatasetEditUC(int datasetId);
  void createDatasetUC(CreateDatasetRequest request);
  void saveDatasetUC(DatasetDto dataset);
  Future<List<NamedIdPair>> getSchemas();
  void showDatasetPreviewUC(int datasetId);
}

