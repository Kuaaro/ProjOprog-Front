import 'package:go_router/go_router.dart';
import 'package:proj_oprog_front/catalog/dto/show_catalog_dto.dart';
import 'package:proj_oprog_front/catalog/icatalog_view.dart';
import 'package:proj_oprog_front/catalog/view_model/catalog_list_view_model_adapter.dart';
import 'package:proj_oprog_front/shared/dtos/named_id_pair.dart';

class PCatalog implements ICatalogView {
  final CatalogListViewModelAdapter viewModelAdapter;
  final GoRouter router;
  PCatalog(this.viewModelAdapter, this.router);

  @override
  void showCatalog(GetCatalogChildrenResponse dto, NamedIdPair? current) {
    if (current != null) {
      final currentStack = viewModelAdapter.getPath();
      if (currentStack.isEmpty || currentStack.last.id != current.id) {
        viewModelAdapter.pushPath(current);
      }
    } else {
      viewModelAdapter.clearPath();
    }
    viewModelAdapter.setData(dto);
    redirectIfNeeded();
  }

  @override
  void showPreviousCatalog(
    GetCatalogChildrenResponse dto,
    NamedIdPair? previousCatalog,
  ) async {
    viewModelAdapter.popPath();
    viewModelAdapter.setData(dto);
    redirectIfNeeded();
  }

  @override
  void showCatalogCreate(int? parentId) {
    router.go('/catalog/create');
  }

  void redirectIfNeeded() {
    final currentLocation = router.routerDelegate.currentConfiguration.uri.path;

    if (currentLocation != '/catalog') {
      router.go('/catalog');
    }
  }
}
