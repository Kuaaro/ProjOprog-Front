import 'package:proj_oprog_front/dataset/dto/show_dataset_dto.dart';
import 'package:proj_oprog_front/dataset/dto/dataset_dto.dart';

abstract class IDatasetView {
  void showDatasetCreate(int? parentCatalogId);
  void showDatasetEdit(ShowDatasetDto dto, int datasetId);
  void showDatasetCreated(int datasetId);
  void showDatasetSaved();
  void showError(String message);
  void showDatasetPreview(DatasetDto dataset, List<dynamic> data);
}

