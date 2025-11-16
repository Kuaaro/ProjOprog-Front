import 'package:proj_oprog_front/metadata_manager/data/model/dtos/get_catalog_children_response.dart';

abstract class ICatalogListView {
  void show(GetCatalogChildrenResponse response, String currentPath);
  void showLoading();
  void showError(String error);
}
