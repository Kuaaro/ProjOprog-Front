import 'package:proj_oprog_front/shared/dtos/named_id_pair.dart';

abstract class ICatalogUseCase {
  // Jeśli null, pokaż root catalog
  void showCatalogUC(NamedIdPair? catalogToShow);

  void showPreviousCatalogUC(NamedIdPair? previous);
  void showCatalogCreateUC(int? parentId);
}
