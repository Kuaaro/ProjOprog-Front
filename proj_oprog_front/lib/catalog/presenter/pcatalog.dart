import 'package:go_router/go_router.dart';
import 'package:proj_oprog_front/catalog/dto/get_catalog_children_response.dart';
import 'package:proj_oprog_front/catalog/icatalog_view.dart';
import 'package:proj_oprog_front/catalog/view_model/catalog_list_view_model_adapter.dart';

class PCatalog implements ICatalogView {
  final CatalogListViewModelAdapter viewModelAdapter;
  final GoRouter router;
  PCatalog(this.viewModelAdapter, this.router);

  @override
  void showCatalog(ShowCatalogDto dto) {
    viewModelAdapter.setData(dto);

    final currentLocation = router.routerDelegate.currentConfiguration.uri.path;

    if (currentLocation != '/catalog') {
      router.go('/catalog');
    }
  }
}
