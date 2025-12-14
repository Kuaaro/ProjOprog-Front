import 'package:proj_oprog_front/catalog/dto/create_catalog_request.dart';
import 'package:proj_oprog_front/catalog/dto/create_catalog_response.dart';
import 'package:proj_oprog_front/catalog/dto/get_catalog_children_response.dart';

abstract class ICatalog {
  Future<GetCatalogChildrenResponse> getCatalogChildren(int id);
  Future<CreateCatalogResponse> createCatalog(CreateCatalogRequest request);
}
