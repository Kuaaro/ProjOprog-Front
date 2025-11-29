import 'package:proj_oprog_front/dataset/dto/show_dataset_dto.dart';

abstract class IDatasetView {
  void showDatasetEdit(ShowDatasetDto dto, int datasetId);
  void showDatasetSaved();
  void showError(String message);
}

