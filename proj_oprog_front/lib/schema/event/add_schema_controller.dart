import 'package:proj_oprog_front/schema/dto/schema_dto.dart';
import 'package:proj_oprog_front/schema/use_case/iadd_schema_uc.dart';

class AddSchemaController {
  final IAddSchemaUC useCase;

  AddSchemaController(this.useCase);

  void showAddSchemaView() {
    useCase.showAddSchemaView();
  }

  Future<void> addSchema(String name, String jsonSchema) async {
    try {
      final schema = SchemaDto(name: name, jsonSchema: jsonSchema);
      await useCase.addSchema(schema);
    } catch (e) {
    }
  }
}