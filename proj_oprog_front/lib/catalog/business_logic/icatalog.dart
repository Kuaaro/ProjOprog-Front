import 'package:proj_oprog_front/catalog/dto/get_catalog_children_response.dart';
import 'package:proj_oprog_front/catalog/dto/catalog_dto.dart';

abstract class ICatalog {
  Future<ShowCatalogDto> getCatalogChildren(int id);
  Future<void> createCatalog(CatalogDto dto);
}
