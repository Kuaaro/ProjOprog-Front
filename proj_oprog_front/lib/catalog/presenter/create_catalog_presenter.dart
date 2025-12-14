import 'package:go_router/go_router.dart';
import 'package:proj_oprog_front/catalog/presenter/icreate_catalog_presenter.dart';
import 'package:proj_oprog_front/catalog/view_model/create_catalog_view_model.dart';

class CreateCatalogPresenter implements ICreateCatalogPresenter {
  final GoRouter router;
  final CreateCatalogViewModel createViewModel;

  CreateCatalogPresenter(this.router, this.createViewModel);

  @override
  void showCreateCatalogForm(int parentId) {
    createViewModel.refresh(parentId);
    router.push('/catalog/create');
  }

  @override
  void closeCreateCatalogForm() {
    router.pop();
  }
}
