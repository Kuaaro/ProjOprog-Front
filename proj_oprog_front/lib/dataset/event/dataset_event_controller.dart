import 'package:proj_oprog_front/dataset/event/idataset_event_controller.dart';
import 'package:proj_oprog_front/dataset/use_case/idataset_uc.dart';
import 'package:proj_oprog_front/dataset/view_model/dataset_edit_view_model.dart';


class DatasetEventController implements IDatasetEventController {
  final IDatasetUseCase appLogic;
  final DatasetEditViewModel viewModel;

  DatasetEventController(this.appLogic, this.viewModel);

  @override
  void onDatasetPressed(int datasetId) {

    viewModel.setLoading(true);
    viewModel.setError(null);

    appLogic.showDatasetEditUC(datasetId);
  }

  @override
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

  @override
  void onCancelPressed() {
    viewModel.clear();
  }
}

