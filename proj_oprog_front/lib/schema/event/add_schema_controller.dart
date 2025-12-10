import 'package:proj_oprog_front/schema/dto/schema_dto.dart';
import 'package:proj_oprog_front/schema/dto/schema_field.dart';
import 'package:proj_oprog_front/schema/use_case/iadd_schema_uc.dart';
import 'package:proj_oprog_front/schema/view_model/add_schema_view_model.dart';

class AddSchemaController {
  final IAddSchemaUC useCase;
  final AddSchemaViewModel viewModel;

  AddSchemaController(this.useCase, this.viewModel);

  void showAddSchemaView() {
    useCase.showAddSchemaView();
  }

  Future<void> submitSchema() async {
    final name = viewModel.schemaNameController.text;
    final jsonSchema = toJsonSchema(viewModel.fields);
    final schema = SchemaDto(name: name, jsonSchema: jsonSchema);
    await useCase.addSchema(schema);

   
  }

}