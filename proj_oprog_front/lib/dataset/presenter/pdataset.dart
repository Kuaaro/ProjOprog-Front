import 'package:go_router/go_router.dart';
import 'package:proj_oprog_front/dataset/dto/show_dataset_dto.dart';
import 'package:proj_oprog_front/dataset/idataset_view.dart';
import 'package:proj_oprog_front/dataset/view_model/dataset_edit_view_model.dart';

class PDataset implements IDatasetView {
  final DatasetEditViewModel viewModel;
  final GoRouter router;

  PDataset(this.viewModel, this.router);

  @override
  void showDatasetCreate(int? parentCatalogId) {
    viewModel.clear();
    viewModel.setLoading(false);
    viewModel.setError(null);
    router.go('/datasets/create${parentCatalogId != null ? '?parentId=$parentCatalogId' : ''}');
  }

  @override
  void showDatasetEdit(ShowDatasetDto dto, int datasetId) {
    viewModel.setDataset(dto.dataset);
    viewModel.setLoading(false);
    viewModel.setError(null);
    router.go('/datasets/$datasetId/edit');
  }

  @override
  void showDatasetCreated(int datasetId) {
    viewModel.clear();
    router.go('/catalog');
  }

  @override
  void showDatasetSaved() {
    viewModel.clear();
    router.go('/catalog');
  }

  @override
  void showError(String message) {
    viewModel.setError(message);
    viewModel.setLoading(false);
  }
}

