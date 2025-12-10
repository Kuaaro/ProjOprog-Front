import 'package:proj_oprog_front/config/router.dart';
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
    router.go('/edit-schema');
  }

  Future<void> saveSchema() async {;

  final name = viewModel.schemaNameController.text;
  final jsonSchema = toJsonSchema(viewModel.fields);
  final schema = SchemaDto(
    id: viewModel.schema?.id,
    name: name,
    jsonSchema: jsonSchema,
  );
  await useCase.editSchema(schema);

  if (viewModel.status == 'Success') {  
      router.go('/schema');
    }


  
}
}