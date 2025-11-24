import 'package:proj_oprog_front/catalog/dto/get_catalog_children_response.dart';

abstract class ICatalogEventController {
  void onCatalogPressed(NamedIdPair catalogPair);
  void onPreviousCatalogPressed(NamedIdPair? previous);
}
