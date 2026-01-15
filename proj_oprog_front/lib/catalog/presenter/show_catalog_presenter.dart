import 'package:go_router/go_router.dart';
import 'package:proj_oprog_front/catalog/dto/get_catalog_children_response.dart';
import 'package:proj_oprog_front/catalog/presenter/ishow_catalog_presenter.dart';
import 'package:proj_oprog_front/catalog/view_model/show_catalog_view_model_adapter.dart';
import 'package:proj_oprog_front/shared/dtos/named_id_pair.dart';

class ShowCatalogPresenter implements IShowCatalogPresenter {
  final ShowCatalogViewModelAdapter viewModelAdapter;
  final GoRouter router;
  ShowCatalogPresenter(this.viewModelAdapter, this.router);

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

  void redirectIfNeeded() {
    final currentLocation = router.routerDelegate.currentConfiguration.uri.path;

    if (currentLocation != '/catalog') {
      router.go('/catalog');
    }
  }
}
