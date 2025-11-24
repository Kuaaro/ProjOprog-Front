import 'package:proj_oprog_front/catalog/dto/show_catalog_dto.dart';
import 'package:proj_oprog_front/catalog/dto/catalog_dto.dart';

abstract class ICatalog {
  Future<ShowCatalogDto> getCatalogChildren(int id);
  Future<void> createCatalog(CatalogDto dto);
}
