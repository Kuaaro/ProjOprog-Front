import 'package:proj_oprog_front/schema/business_logic/idata_schema.dart';

import '../dto/schema_dto.dart';
import '../presenter/iedit_schema_presenter.dart';
import 'iedit_schema_uc.dart';

class EditSchemaUC implements IEditSchemaUC {
  final IDataSchema _service;
  final IEditSchemaPresenter presenter;

  EditSchemaUC(this._service, this.presenter);

@override
Future<void> editSchema(SchemaDto schema) async {
  try {
    await _service.editSchema(schema);
    presenter.onSchemaEdited(schema);
  } catch (e) {
    presenter.onError(e.toString());
  }
}

  @override
  void showEditSchemaView(int id) async{
    SchemaDto dto = await _service.getSchema(id);
    dto = SchemaDto(
      id: id.toString(),
      name: dto.name,
      jsonSchema: dto.jsonSchema,
    );
    presenter.onShowEditSchemaView(dto);
  }

}
