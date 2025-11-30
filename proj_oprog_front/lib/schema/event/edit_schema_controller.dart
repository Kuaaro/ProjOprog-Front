import 'package:proj_oprog_front/schema/dto/schema_dto.dart';
import 'package:proj_oprog_front/schema/use_case/iedit_schema_uc.dart';

class EditSchemaController {
  final IEditSchemaUC useCase;

  EditSchemaController(this.useCase);

    void showEditSchemaView(int id) {
    useCase.showEditSchemaView(id);
  }

  Future<void> saveSchema(String id, String name, String jsonSchema) async {
    try {
      final schema = SchemaDto(id: id, name: name, jsonSchema: jsonSchema);
      await useCase.editSchema(schema);
    } catch (e) {
      print(e.toString());
    }
  }
}