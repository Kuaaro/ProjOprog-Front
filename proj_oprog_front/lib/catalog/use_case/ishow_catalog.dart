import 'package:proj_oprog_front/shared/dtos/named_id_pair.dart';

abstract class IShowCatalog {
  // Jeśli null, pokaż root catalog
  void showCatalog(NamedIdPair? catalogToShow);

  void showPreviousCatalog(NamedIdPair? previous);
}
