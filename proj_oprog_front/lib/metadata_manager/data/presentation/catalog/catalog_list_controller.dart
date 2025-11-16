import 'package:proj_oprog_front/metadata_manager/data/services/catalog_service.dart';
import 'package:proj_oprog_front/metadata_manager/data/presentation/catalog/interface/icatalog_list_view.dart';
import 'package:proj_oprog_front/metadata_manager/data/presentation/catalog/interface/icatalog_list_controller.dart';

class CatalogListController implements ICatalogListController {
  final ICatalogListView view;
  final CatalogService service;

  // Stan
  final List<int> _catalogIdStack = [0];
  final List<String> _pathNames = [];

  CatalogListController({required this.view, required this.service});

  String _getCurrentPath() {
    if (_pathNames.isEmpty) {
      return '/';
    }
    return '/${_pathNames.join('/')}';
  }

  @override
  void loadCatalogChildren(int catalogId) async {
    view.showLoading();

    try {
      final response = await service.getCatalogChildren(catalogId);
      view.show(response, _getCurrentPath());
    } catch (e) {
      view.showError(e.toString());
    }
  }

  @override
  void onCatalogSelected(int catalogId, String catalogName) {
    _catalogIdStack.add(catalogId);
    _pathNames.add(catalogName);

    loadCatalogChildren(catalogId);
  }

  @override
  void onBackPressed() {
    if (_catalogIdStack.length > 1) {
      _catalogIdStack.removeLast();
      _pathNames.removeLast();

      final previousId = _catalogIdStack.last;

      view.showLoading();

      service
          .getCatalogChildren(previousId)
          .then((response) {
            view.show(response, _getCurrentPath());
          })
          .catchError((e) {
            view.showError(e.toString());
          });
    }
  }

  @override
  void onNewCatalogPressed() {
    // TODO: implement
    print('New catalog pressed');
  }

  bool canGoBack() {
    return _catalogIdStack.length > 1;
  }
}
