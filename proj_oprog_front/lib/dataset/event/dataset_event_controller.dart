import 'package:proj_oprog_front/dataset/dto/create_dataset_request.dart';
import 'package:proj_oprog_front/dataset/use_case/idataset_uc.dart';
import 'package:proj_oprog_front/dataset/view_model/dataset_edit_view_model.dart';
import 'package:proj_oprog_front/dataset/view_model/dataset_preview_view_model.dart';

class DatasetEventController {
  final IDatasetUseCase appLogic;
  final DatasetEditViewModel editViewModel;
  final DatasetPreviewViewModel previewViewModel;

  DatasetEventController(this.appLogic, this.editViewModel, this.previewViewModel);

  void onNewPressed(int? parentCatalogId) async {
    editViewModel.setLoading(false);
    editViewModel.setError(null);
    final schemas = await appLogic.getSchemas();
    editViewModel.setSchemas(schemas);
    appLogic.showDatasetCreateUC(parentCatalogId);
  }

  void onDatasetPressed(int datasetId) async {
    editViewModel.setLoading(true);
    editViewModel.setError(null);
    final schemas = await appLogic.getSchemas();
    editViewModel.setSchemas(schemas);
    appLogic.showDatasetEditUC(datasetId);
  }

  void onCreatePressed(int? parentCatalogId) {
    final dataset = editViewModel.dataset;
    
    if (dataset == null) {
      editViewModel.setError('No dataset data to create');
      return;
    }
    
    editViewModel.setLoading(true);
    editViewModel.setError(null);
    
    final request = CreateDatasetRequest(
      name: dataset.name,
      description: dataset.desc,
      contactPoint: dataset.contactPoint,
      keywords: dataset.keywords,
      distributions: dataset.distributions,
      schemaId: dataset.schemaId,
      parentId: parentCatalogId ?? 0,
    );
    
    appLogic.createDatasetUC(request);
  }

  void onSavePressed() {
    final dataset = editViewModel.dataset;
    
    if (dataset == null) {
      editViewModel.setError('No dataset to save');
      return;
    }
    
    editViewModel.setLoading(true);
    editViewModel.setError(null);
    appLogic.saveDatasetUC(dataset);
  }

  void onCancelPressed() {
    editViewModel.clear();
  }

  void onPreviewDataset(int datasetId) {
    previewViewModel.clear();
    previewViewModel.setLoading(true);
    appLogic.showDatasetPreviewUC(datasetId);
  }
}

