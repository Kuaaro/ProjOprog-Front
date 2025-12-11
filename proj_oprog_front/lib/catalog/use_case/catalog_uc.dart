import 'package:proj_oprog_front/catalog/business_logic/icatalog.dart';
import 'package:proj_oprog_front/catalog/dto/show_catalog_dto.dart';
import 'package:proj_oprog_front/catalog/icatalog_view.dart';
import 'package:proj_oprog_front/catalog/use_case/icatalog_uc.dart';
import 'package:proj_oprog_front/shared/dtos/named_id_pair.dart';

class CatalogUseCase implements ICatalogUseCase {
  final ICatalogView view;
  final ICatalog service;

  CatalogUseCase(this.view, this.service);

  @override
  void showCatalogUC(NamedIdPair? catalogToShow) async {
    final response = await getCatalogData(catalogToShow);
    view.showCatalog(response, catalogToShow);
  }

  @override
  void showPreviousCatalogUC(NamedIdPair? previous) async {
    final response = await getCatalogData(previous);
    view.showPreviousCatalog(response, previous);
  }
  @override
  void showCatalogCreateUC(int? parentId) async {
    view.showCatalogCreate(parentId);
  }
  @override
  void createCatalogUC(parentId) async {
    //final response = await service.createCatalog(parentId);
    //view.showCatalog(response, NamedIdPair(id: parentId ?? 0, name: ''));
    return;
  }

  @override
  void cancelCatalogCreationUC() async {
    view.cancelCatalogCreation();
  }

  Future<GetCatalogChildrenResponse> getCatalogData(
    NamedIdPair? catalog,
  ) async {
    final catalogId = catalog?.id ?? 0;
    return await service.getCatalogChildren(catalogId);
  }
  
}
