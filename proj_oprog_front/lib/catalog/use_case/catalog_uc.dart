import 'package:proj_oprog_front/catalog/business_logic/icatalog.dart';
import 'package:proj_oprog_front/catalog/dto/get_catalog_children_response.dart';
import 'package:proj_oprog_front/catalog/icatalog_view.dart';
import 'package:proj_oprog_front/catalog/use_case/icatalog_uc.dart';
import 'package:proj_oprog_front/catalog/view_model/catalog_list_view_model_adapter.dart';

class CatalogUseCase implements ICatalogUseCase {
  final ICatalogView view;
  final ICatalog service;
  final CatalogListViewModelAdapter viewModelAdapter;

  CatalogUseCase(this.view, this.service, this.viewModelAdapter);

  @override
  void showCatalogUC(NamedIdPair? nameIdPair) async {
    if (nameIdPair != null) {
      viewModelAdapter.pushPath(nameIdPair);
    } else {
      viewModelAdapter.clearPath();
    }

    final catalogId = nameIdPair?.id ?? 0;
    final response = await service.getCatalogChildren(catalogId);
    view.showCatalog(response);
  }

  @override
  void showPreviousCatalogUC() async {
    viewModelAdapter.popPath();
    final path = viewModelAdapter.getPath();

    final catalogId = path.isEmpty ? 0 : path.last.id;
    final response = await service.getCatalogChildren(catalogId);
    view.showCatalog(response);
  }
}
