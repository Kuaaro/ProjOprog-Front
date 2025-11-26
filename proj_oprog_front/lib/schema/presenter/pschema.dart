import 'package:proj_oprog_front/schema/dto/name_id_pair.dart';

import '../use_case/show_schema_list_uc.dart';
import '../view_model/schema_list_view_model.dart';
import 'ipschema.dart';
import 'package:go_router/go_router.dart';

class PSchema implements ISchemaView {
  final SchemaListViewModel viewModel;
  final GoRouter router;

  PSchema(this.viewModel, this.router);

 @override
  void showSchemaList(List<NameIdPair> schemas) {
    viewModel.schemas = schemas;
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

