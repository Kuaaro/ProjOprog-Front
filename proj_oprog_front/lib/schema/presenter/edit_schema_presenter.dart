import 'package:proj_oprog_front/config/router.dart';
import 'package:proj_oprog_front/schema/dto/schema_field.dart';
import 'package:proj_oprog_front/schema/view_model/edit_schema_view_model.dart';

import '../dto/schema_dto.dart';
import 'iedit_schema_presenter.dart';

class EditSchemaPresenter implements IEditSchemaPresenter {
  final EditSchemaViewModel viewModel;

  EditSchemaPresenter(this.viewModel);

@override
void onShowEditSchemaView(SchemaDto schema) {
  List<SchemaField> fields = fromJsonSchema(schema.jsonSchema);

  viewModel.setSchema(schema);
  viewModel.setFields(fields);
  viewModel.setStatus('Success');

  router.go('/edit-schema');
}

@override
void onSchemaEdited(SchemaDto schema) {
  viewModel.clearFields();
  viewModel.setStatus('');
  router.go('/schema');
}

  @override
  void onError(String error) {
    viewModel.setStatus('Error: $error');
  }
}