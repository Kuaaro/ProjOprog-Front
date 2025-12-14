import 'package:proj_oprog_front/shared/dtos/named_id_pair.dart';

abstract class IShowCatalogEventController {
  void onCatalogPressed(NamedIdPair catalogPair);
  void onPreviousCatalogPressed(NamedIdPair? previous);
}
