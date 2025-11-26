import 'package:proj_oprog_front/catalog/dto/show_catalog_dto.dart';

abstract class ICatalogUseCase {
  // Jeśli null, pokaż root catalog
  void showCatalogUC(NamedIdPair? catalogToShow);

  void showPreviousCatalogUC(NamedIdPair? previous);
}
