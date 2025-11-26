import 'package:proj_oprog_front/catalog/dto/show_catalog_dto.dart';
import 'package:proj_oprog_front/shared/dtos/named_id_pair.dart';

abstract class ICatalogView {
  void showCatalog(ShowCatalogDto dto, NamedIdPair? catalogToShow);
  void showPreviousCatalog(ShowCatalogDto dto, NamedIdPair? previousCatalog);
}
