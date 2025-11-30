import 'package:proj_oprog_front/config/router.dart';

import '../dto/schema_dto.dart';
import '../view_model/v_edit_schema_view_model.dart';
import 'iedit_schema_presenter.dart';

class EditSchemaPresenter implements IEditSchemaPresenter {
  final EditSchemaViewModel viewModel;

  EditSchemaPresenter(this.viewModel);

  @override
  void onShowEditSchemaView(SchemaDto schema) {
    viewModel.setSchema(schema);
    viewModel.setStatus('Editing schema');
    router.go('/edit-schema');
  }

  @override
  void onSchemaEdited(SchemaDto schema) {
    viewModel.setSchema(schema);
    viewModel.setStatus('Schema saved successfully');
    router.go('/edit-schema');
  }

  @override
  void onError(String error) {
    viewModel.setStatus('Error: $error');
    router.go('/edit-schema');
  }
}