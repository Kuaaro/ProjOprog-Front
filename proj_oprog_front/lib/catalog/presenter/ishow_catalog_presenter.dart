import 'package:proj_oprog_front/catalog/dto/get_catalog_children_response.dart';
import 'package:proj_oprog_front/shared/dtos/named_id_pair.dart';

abstract class IShowCatalogPresenter {
  void showCatalog(GetCatalogChildrenResponse dto, NamedIdPair? catalogToShow);
  void showPreviousCatalog(
    GetCatalogChildrenResponse dto,
    NamedIdPair? previousCatalog,
  );
}
