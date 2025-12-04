import 'package:proj_oprog_front/dataset/business_logic/idataset.dart';
import 'package:proj_oprog_front/dataset/dto/show_dataset_dto.dart';
import 'package:proj_oprog_front/dataset/dto/dataset_dto.dart';
import 'package:proj_oprog_front/dataset/dto/modify_dataset_request.dart';  
import 'package:proj_oprog_front/dataset/idataset_view.dart';
import 'package:proj_oprog_front/dataset/use_case/idataset_uc.dart';
import 'package:proj_oprog_front/dataset/view_model/dataset_edit_view_model.dart';

class DatasetUseCase implements IDatasetUseCase {
  final IDatasetView view;
  final IDataset service;
  
  DatasetUseCase(this.view, this.service);

  @override
  void showDatasetEditUC(int datasetId) async {
    
    try {
      final dataset = await service.getDataset(datasetId);
 
      view.showDatasetEdit(ShowDatasetDto(dataset: dataset), datasetId);
    } catch (e) {
      view.showError('Failed to load dataset: $e');
    }  
  }

 @override
  void saveDatasetUC(DatasetDto dataset) async {   
    try {
      final request = ModifyDatasetRequest.fromDatasetDto(dataset);
      await service.modifyDataset(dataset.id, request);
      view.showDatasetSaved();
    } catch (e) {
      view.showError('Failed to save dataset: $e');
    }
  }
}

