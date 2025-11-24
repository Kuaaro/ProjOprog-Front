import 'package:go_router/go_router.dart';
import 'package:proj_oprog_front/metadata_manager/data/model/dtos/get_catalog_children_response.dart';
import 'package:proj_oprog_front/metadata_manager/view/catalog/icatalog_view.dart';
import 'package:proj_oprog_front/metadata_manager/view/catalog/view_model/catalog_list_view_model_adapter.dart';

class CatalogPresenter implements ICatalogView {
  final CatalogListViewModelAdapter viewModelAdapter;
  final GoRouter router;
  CatalogPresenter(this.viewModelAdapter, this.router);

  @override
  void showCatalog(ShowCatalogDto dto) {
    viewModelAdapter.setData(dto);

    final currentLocation = router.routerDelegate.currentConfiguration.uri.path;

    if (currentLocation != '/catalog') {
      router.go('/catalog');
    }
  }
}
