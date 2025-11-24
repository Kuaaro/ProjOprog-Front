import 'package:proj_oprog_front/catalog/dto/show_catalog_dto.dart';

abstract class ICatalogView {
  void showCatalog(ShowCatalogDto dto, NamedIdPair? catalogToShow);
  void showPreviousCatalog(ShowCatalogDto dto, NamedIdPair? previousCatalog);
}
