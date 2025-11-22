import 'package:proj_oprog_front/metadata_manager/view/catalog/icatalog_view.dart';
import 'package:proj_oprog_front/metadata_manager/uc/icatalog_uc.dart';
import 'package:proj_oprog_front/metadata_manager/data/services/interface/icatalog.dart';

class CatalogUseCase implements ICatalogUseCase {
  final ICatalogView view;
  final ICatalog service;

  CatalogUseCase(this.view, this.service);

  @override
  void showCatalogUC(int catalogId) async {
    final response = await service.getCatalogChildren(catalogId);
    view.showCatalog(response);
  }
}
