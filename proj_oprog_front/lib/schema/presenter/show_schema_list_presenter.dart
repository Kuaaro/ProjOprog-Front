import 'package:proj_oprog_front/schema/dto/get_schema_list_response.dart';
import '../view_model/show_schema_list_view_model.dart';
import 'i_show_schema_list_presenter.dart';
import 'package:go_router/go_router.dart';

class ShowSchemaListPresenter implements IShowSchemaListPresenter {
  final ShowSchemaListViewModel viewModel;
  final GoRouter router;

  ShowSchemaListPresenter(this.viewModel, this.router);

  @override
  void showSchemaList(GetSchemaListResponse schemas) {
    viewModel.schemas = schemas.schemas;
    viewModel.error = null;
    viewModel.isLoading = false;
    router.go('/schema');
  }

  @override
  void showError(String message) {
    viewModel.error = message;
    viewModel.schemas = [];
    viewModel.isLoading = false;
    router.go('/schema');
  }
}
