import 'package:proj_oprog_front/catalog/business_logic/icatalog.dart';
import 'package:proj_oprog_front/catalog/dto/get_catalog_children_response.dart';
import 'package:proj_oprog_front/catalog/presenter/ishow_catalog_presenter.dart';
import 'package:proj_oprog_front/catalog/use_case/ishow_catalog.dart';
import 'package:proj_oprog_front/shared/dtos/named_id_pair.dart';

class ShowCatalog implements IShowCatalog {
  final IShowCatalogPresenter showCatalogPresenter;
  final ICatalog service;

  ShowCatalog(this.showCatalogPresenter, this.service);

  @override
  void showCatalog(NamedIdPair? catalogToShow) async {
    final response = await getCatalogData(catalogToShow);
    showCatalogPresenter.showCatalog(response, catalogToShow);
  }

  @override
  void showPreviousCatalog(NamedIdPair? previous) async {
    final response = await getCatalogData(previous);
    showCatalogPresenter.showPreviousCatalog(response, previous);
  }

  Future<GetCatalogChildrenResponse> getCatalogData(
    NamedIdPair? catalog,
  ) async {
    final catalogId = catalog?.id ?? 0;
    return await service.getCatalogChildren(catalogId);
  }
}
