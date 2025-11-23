import 'package:proj_oprog_front/metadata_manager/data/model/dtos/get_catalog_children_response.dart';
import 'package:proj_oprog_front/metadata_manager/view/catalog/icatalog_view.dart';
import 'package:proj_oprog_front/metadata_manager/uc/icatalog_uc.dart';
import 'package:proj_oprog_front/metadata_manager/data/services/interface/icatalog.dart';
import 'package:proj_oprog_front/metadata_manager/view/catalog/view_model/catalog_list_view_model_adapter.dart';

class CatalogUseCase implements ICatalogUseCase {
  final ICatalogView view;
  final ICatalog service;
  final CatalogListViewModelAdapter viewModelAdapter;

  CatalogUseCase(this.view, this.service, this.viewModelAdapter);

  @override
  void showCatalogUC(NamedIdPair? nameIdPair) async {
    if (nameIdPair != null) {
      final response = await service.getCatalogChildren(nameIdPair.id);
      viewModelAdapter.pushPath(nameIdPair);
      view.showCatalog(response);
    } else {
      final response = await service.getCatalogChildren(0);
      viewModelAdapter.clearPath();
      view.showCatalog(response);
    }
  }
}
