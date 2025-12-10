import 'package:proj_oprog_front/schema/dto/modify_schema_request.dart';
import 'package:proj_oprog_front/schema/dto/schema_field.dart';
import 'package:proj_oprog_front/schema/use_case/iedit_schema_uc.dart';
import 'package:proj_oprog_front/schema/use_case/ishow_schema_list_uc.dart';
import 'package:proj_oprog_front/schema/view_model/edit_schema_view_model.dart';

class EditSchemaController {
  final IEditSchemaUC editSchemaUC;
  final IShowSchemaListUC showSchemaListUC;
  final EditSchemaViewModel viewModel;

  EditSchemaController({
    required this.editSchemaUC,
    required this.showSchemaListUC,
    required this.viewModel,
  });

  Future<void> saveSchema() async {
    final name = viewModel.schemaNameController.text;
    final jsonSchema = toJsonSchema(viewModel.fields);
    try {
      final schema = ModifySchemaRequest(name: name, jsonSchema: jsonSchema);
      await editSchemaUC.editSchema(schema, viewModel.id);
      viewModel.setStatus('Schema edited successfully');
    } catch (e) {
      viewModel.setStatus('Error: ${e.toString()}');
    }
  }

    void cancel() {
    showSchemaListUC.showSchemaListUC();
  }

  
}