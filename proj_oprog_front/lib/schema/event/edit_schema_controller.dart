import 'package:proj_oprog_front/schema/dto/schema_dto.dart';
import 'package:proj_oprog_front/schema/dto/schema_field.dart';
import 'package:proj_oprog_front/schema/use_case/iedit_schema_uc.dart';
import 'package:proj_oprog_front/schema/view_model/edit_schema_view_model.dart';

class EditSchemaController {
  final IEditSchemaUC useCase;
  final EditSchemaViewModel viewModel;

  EditSchemaController(this.useCase, this.viewModel);

  void showEditSchemaView(int id) {
    useCase.showEditSchemaView(id);
  }

  Future<void> saveSchema() async {
    final name = viewModel.schemaNameController.text;
    final jsonSchema = toJsonSchema(viewModel.fields);
    try {
      final schema = SchemaDto(name: name, jsonSchema: jsonSchema);
      await useCase.editSchema(schema);
      viewModel.setStatus('Schema added successfully');
    } catch (e) {
      viewModel.setStatus('Error: ${e.toString()}');
    }
  }

  
}