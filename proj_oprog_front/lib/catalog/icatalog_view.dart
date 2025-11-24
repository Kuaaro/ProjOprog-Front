import 'package:proj_oprog_front/catalog/dto/get_catalog_children_response.dart';

abstract class ICatalogView {
  void showCatalog(ShowCatalogDto dto, NamedIdPair? catalogToShow);
  void showPreviousCatalog(ShowCatalogDto dto, NamedIdPair? previousCatalog);
}
