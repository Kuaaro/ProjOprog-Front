import 'package:proj_oprog_front/catalog/dto/show_catalog_dto.dart';

abstract class ICatalogEventController {
  void onCatalogPressed(NamedIdPair pressedCatalog);
  void onPreviousCatalogPressed(NamedIdPair? previous);
}
