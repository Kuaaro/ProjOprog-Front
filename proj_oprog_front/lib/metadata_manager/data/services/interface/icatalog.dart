import 'package:proj_oprog_front/metadata_manager/data/model/dtos/get_catalog_children_response.dart';
import 'package:proj_oprog_front/metadata_manager/data/model/dtos/catalog_dto.dart';

abstract class ICatalog {
  Future<GetCatalogChildrenResponse> getCatalogChildren(int id);
  Future<void> createCatalog(CatalogDto dto);
}
