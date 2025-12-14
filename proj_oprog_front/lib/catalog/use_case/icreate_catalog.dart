import 'package:proj_oprog_front/catalog/dto/create_catalog_request.dart';

abstract class ICreateCatalog {
  void showNewCatalogForm(int parentId);
  void createCatalog(CreateCatalogRequest req);
}
