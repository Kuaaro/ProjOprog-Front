import 'package:proj_oprog_front/metadata_manager/data/model/dtos/get_catalog_children_response.dart';

abstract class ICatalogUseCase {
  // Jeśli null, pokaż root catalog
  void showCatalogUC(NamedIdPair? catalogPair);

  void showPreviousCatalogUC();
}
