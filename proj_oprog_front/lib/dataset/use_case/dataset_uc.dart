import 'package:proj_oprog_front/dataset/business_logic/idataset.dart';
import 'package:proj_oprog_front/dataset/dto/show_dataset_dto.dart';
import 'package:proj_oprog_front/dataset/dto/dataset_dto.dart';
import 'package:proj_oprog_front/dataset/dto/modify_dataset_request.dart';
import 'package:proj_oprog_front/dataset/dto/create_dataset_request.dart';
import 'package:proj_oprog_front/dataset/idataset_view.dart';
import 'package:proj_oprog_front/dataset/use_case/idataset_uc.dart';
import 'package:proj_oprog_front/dataset/view_model/dataset_edit_view_model.dart';
import 'package:proj_oprog_front/schema/business_logic/idata_schema.dart';
import 'package:proj_oprog_front/shared/dtos/named_id_pair.dart';

class DatasetUseCase implements IDatasetUseCase {
  final IDatasetView view;
  final IDataset service;
  final IDataSchema schemaService;
  
  DatasetUseCase(this.view, this.service, this.schemaService);

  @override
  void showDatasetCreateUC(int? parentCatalogId) {
    view.showDatasetCreate(parentCatalogId);
  }

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
  void createDatasetUC(CreateDatasetRequest request) async {
    try {
      final id = await service.createDataset(request);
      view.showDatasetCreated(id);
    } catch (e) {
      view.showError('Failed to create dataset: $e');
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

  @override
  void showDatasetPreviewUC(int datasetId) async {
    try {
      final dataset = await service.getDataset(datasetId);
      
      final data = await service.getDatasetData(datasetId);

      view.showDatasetPreview(dataset, data);
    } catch (e) {
      view.showError('Failed to load dataset preview: $e');
    }
  }

  @override
  Future<List<NamedIdPair>> getSchemas() async {
    try {
      final schemas = await schemaService.getSchemaList();
      return [
        NamedIdPair(name: 'No Schema', id: 0),
        ...schemas.schemas
      ];
    } catch (e) {
      
      return [NamedIdPair(name: 'No Schema', id: 0)]; 
    }
  }
}

