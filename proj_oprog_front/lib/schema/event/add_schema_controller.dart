import 'package:proj_oprog_front/schema/dto/create_schema_request.dart';
import 'package:proj_oprog_front/schema/dto/schema_field.dart';
import 'package:proj_oprog_front/schema/use_case/iadd_schema_uc.dart';
import 'package:proj_oprog_front/schema/use_case/ishow_schema_list_uc.dart';
import 'package:proj_oprog_front/schema/view_model/add_schema_view_model.dart';

class AddSchemaController {
  final IAddSchemaUC addSchemaUC;
  final IShowSchemaListUC showSchemaListUC;
  final AddSchemaViewModel viewModel;

  AddSchemaController({
    required this.addSchemaUC,
    required this.showSchemaListUC,
    required this.viewModel,
  });

  Future<void> submitSchema() async {
    final name = viewModel.schemaNameController.text;
    final jsonSchema = toJsonSchema(viewModel.fields);
    try {
      final schema = CreateSchemaRequest(name: name, jsonSchema: jsonSchema);
      await addSchemaUC.addSchema(schema);
      showSchemaListUC.showSchemaListUC();
    } catch (e) {
      viewModel.setStatus('Error: ${e.toString()}');
    }
  }

  void cancel() {
    showSchemaListUC.showSchemaListUC();
  }
}
