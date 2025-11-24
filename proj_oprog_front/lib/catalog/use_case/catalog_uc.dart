import 'package:proj_oprog_front/catalog/business_logic/icatalog.dart';
import 'package:proj_oprog_front/catalog/dto/get_catalog_children_response.dart';
import 'package:proj_oprog_front/catalog/icatalog_view.dart';
import 'package:proj_oprog_front/catalog/use_case/icatalog_uc.dart';

class CatalogUseCase implements ICatalogUseCase {
  final ICatalogView view;
  final ICatalog service;

  CatalogUseCase(this.view, this.service);

  @override
  void showCatalogUC(NamedIdPair? catalogToShow) async {
    final catalogId = catalogToShow?.id ?? 0;
    final response = await service.getCatalogChildren(catalogId);
    view.showCatalog(response, catalogToShow);
  }

  @override
  void showPreviousCatalogUC(NamedIdPair? previous) async {
    final catalogId = previous?.id ?? 0;
    final response = await service.getCatalogChildren(catalogId);
    view.showPreviousCatalog(response, previous);
  }
}
