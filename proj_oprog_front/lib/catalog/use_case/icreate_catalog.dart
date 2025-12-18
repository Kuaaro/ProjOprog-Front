import 'package:proj_oprog_front/catalog/dto/create_catalog_request.dart';
import 'package:proj_oprog_front/shared/dtos/named_id_pair.dart';

abstract class ICreateCatalog {
  void showNewCatalogForm(int parentId);
  void createCatalog(CreateCatalogRequest req, NamedIdPair? parent);
  void cancelCreateCatalog();
}
