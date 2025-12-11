import 'package:proj_oprog_front/catalog/dto/show_catalog_dto.dart';
import 'package:proj_oprog_front/shared/dtos/named_id_pair.dart';

abstract class ICatalogView {
  void showCatalog(GetCatalogChildrenResponse dto, NamedIdPair? catalogToShow);
  void showPreviousCatalog(
    GetCatalogChildrenResponse dto,
    NamedIdPair? previousCatalog,
  );
  void showCatalogCreate(int? parentId);
  void cancelCatalogCreation();
}
