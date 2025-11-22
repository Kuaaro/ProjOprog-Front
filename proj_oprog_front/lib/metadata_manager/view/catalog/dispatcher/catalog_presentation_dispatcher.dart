import 'package:proj_oprog_front/metadata_manager/data/model/dtos/get_catalog_children_response.dart';
import 'package:proj_oprog_front/metadata_manager/view/catalog/icatalog_view.dart';
import 'package:proj_oprog_front/metadata_manager/view/catalog/view/vcatalog_list_view.dart';
import 'package:proj_oprog_front/metadata_manager/view/catalog/view_model/catalog_list_view_model_adapter.dart';

class CatalogPresentationDispatcher implements ICatalogView {
  final VCatalogListView view;
  final CatalogListViewModelAdapter viewModelAdapter;
  CatalogPresentationDispatcher(this.view, this.viewModelAdapter);

  @override
  void showCatalog(ShowCatalogDto dto) {
    viewModelAdapter.setData(dto);
    view.show();
  }
}
