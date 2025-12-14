import 'package:go_router/go_router.dart';
import 'package:proj_oprog_front/catalog/presenter/icreate_catalog_presenter.dart';
import 'package:proj_oprog_front/catalog/view_model/show_catalog_view_model.dart';
import 'package:proj_oprog_front/catalog/view_model/create_catalog_view_model.dart';

class CreateCatalogPresenter implements ICreateCatalogPresenter {
  final GoRouter router;
  final CreateCatalogViewModel createViewModel;
  final ShowCatalogViewModel listViewModel;
  CreateCatalogPresenter(this.router, this.createViewModel, this.listViewModel);

  @override
  void showCreateCatalogForm(int parentId) {
    createViewModel.refresh(parentId);
    router.go('/catalog/create');
  }
}
