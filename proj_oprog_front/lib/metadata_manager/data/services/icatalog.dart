import 'package:proj_oprog_front/metadata_manager/data/model/dtos/catalog_dto.dart';

abstract class ICatalog {
  List<CatalogDto> getCatalogChildren(int id);
  void createCatalog(CatalogDto dto);
}