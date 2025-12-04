import 'package:proj_oprog_front/dataset/use_case/idataset_uc.dart';
import 'package:proj_oprog_front/dataset/view_model/dataset_edit_view_model.dart';


class DatasetEventController {
  final IDatasetUseCase appLogic;
  final DatasetEditViewModel viewModel;

  DatasetEventController(this.appLogic, this.viewModel);

  void onDatasetPressed(int datasetId) {

    viewModel.setLoading(true);
    viewModel.setError(null);

    appLogic.showDatasetEditUC(datasetId);
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

