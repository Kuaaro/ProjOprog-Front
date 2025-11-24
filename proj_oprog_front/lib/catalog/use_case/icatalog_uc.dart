import 'package:proj_oprog_front/catalog/dto/get_catalog_children_response.dart';

abstract class ICatalogUseCase {
  // Jeśli null, pokaż root catalog
  void showCatalogUC(NamedIdPair? catalogPair);

  void showPreviousCatalogUC();
}
