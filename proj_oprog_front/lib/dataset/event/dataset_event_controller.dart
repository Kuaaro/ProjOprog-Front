import 'package:proj_oprog_front/dataset/dto/create_dataset_request.dart';
import 'package:proj_oprog_front/dataset/use_case/idataset_uc.dart';
import 'package:proj_oprog_front/dataset/view_model/dataset_edit_view_model.dart';

class DatasetEventController {
  final IDatasetUseCase appLogic;
  final DatasetEditViewModel viewModel;

  DatasetEventController(this.appLogic, this.viewModel);

  void onNewPressed(int? parentCatalogId) async {
    viewModel.setLoading(false);
    viewModel.setError(null);
    final schemas = await appLogic.getSchemas();
    viewModel.setSchemas(schemas);
    appLogic.showDatasetCreateUC(parentCatalogId);
  }

  void onDatasetPressed(int datasetId) async {
    viewModel.setLoading(true);
    viewModel.setError(null);
    final schemas = await appLogic.getSchemas();
    viewModel.setSchemas(schemas);
    appLogic.showDatasetEditUC(datasetId);
  }

  void onCreatePressed(int? parentCatalogId) {
    final dataset = viewModel.dataset;
    
    if (dataset == null) {
      viewModel.setError('No dataset data to create');
      return;
    }
    
    viewModel.setLoading(true);
    viewModel.setError(null);
    
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
    final dataset = viewModel.dataset;
    
    if (dataset == null) {
      viewModel.setError('No dataset to save');
      return;
    }
    
    viewModel.setLoading(true);
    viewModel.setError(null);
    appLogic.saveDatasetUC(dataset);
  }

  void onCancelPressed() {
    viewModel.clear();
  }
}

