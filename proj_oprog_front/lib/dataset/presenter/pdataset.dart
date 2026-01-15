import 'package:go_router/go_router.dart';
import 'package:proj_oprog_front/dataset/dto/show_dataset_dto.dart';
import 'package:proj_oprog_front/dataset/idataset_view.dart';
import 'package:proj_oprog_front/dataset/view_model/dataset_edit_view_model.dart';
import 'package:proj_oprog_front/dataset/dto/dataset_dto.dart'; 
import 'package:proj_oprog_front/dataset/view_model/dataset_preview_view_model.dart';

class PDataset implements IDatasetView {
  final DatasetEditViewModel editViewModel;
  final DatasetPreviewViewModel previewViewModel;
  final GoRouter router;

  PDataset(this.editViewModel, this.previewViewModel, this.router);

  @override
  void showDatasetCreate(int? parentCatalogId) {
    editViewModel.clear();
    editViewModel.setLoading(false);
    editViewModel.setError(null);
    router.go('/datasets/create${parentCatalogId != null ? '?parentId=$parentCatalogId' : ''}');
  }

  @override
  void showDatasetEdit(ShowDatasetDto dto, int datasetId) {
    editViewModel.setDataset(dto.dataset);
    editViewModel.setLoading(false);
    editViewModel.setError(null);
    router.go('/datasets/$datasetId/edit');
  }

  @override
  void showDatasetCreated(int datasetId) {
    editViewModel.clear();
    router.go('/catalog');
  }

  @override
  void showDatasetSaved() {
    editViewModel.clear();
    router.go('/catalog');
  }

  @override
  void showError(String message) {
    editViewModel.setError(message);
    editViewModel.setLoading(false);

    previewViewModel.setError(message);
    previewViewModel.setLoading(false);
  }

  @override
  void showDatasetPreview(DatasetDto dataset, List<dynamic> data) {
    previewViewModel.setLoading(false);
    previewViewModel.setDataset(dataset);
    previewViewModel.setPreviewData(data);
    previewViewModel.setError(null);
  }
}

