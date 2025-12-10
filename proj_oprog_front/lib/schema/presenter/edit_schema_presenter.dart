import 'package:proj_oprog_front/config/router.dart';
import 'package:proj_oprog_front/schema/dto/get_schema_response.dart';
import 'package:proj_oprog_front/schema/dto/modify_schema_request.dart';
import 'package:proj_oprog_front/schema/dto/schema_field.dart';
import 'package:proj_oprog_front/schema/view_model/edit_schema_view_model.dart';

import '../dto/schema_dto.dart';
import 'iedit_schema_presenter.dart';

class EditSchemaPresenter implements IEditSchemaPresenter {
  final EditSchemaViewModel viewModel;

  EditSchemaPresenter(this.viewModel);

  @override
  void onShowEditSchemaView(GetSchemaResponse schema, int id) {
    List<SchemaField> fields = fromJsonSchema(schema.jsonSchema);
    viewModel.fields = fields;
    SchemaDto dto = SchemaDto(name: schema.name, jsonSchema: schema.jsonSchema);
    viewModel.setSchema(dto);
    viewModel.setId(id);
    router.go('/edit-schema');
  }

  @override
  void onSchemaEdited(ModifySchemaRequest schema) {
    viewModel.setStatus('Schema saved successfully');
    router.go('/edit-schema');
  }

  @override
  void onError(String error) {
    viewModel.setStatus('Error: $error');
    router.go('/edit-schema');
  }
}