import 'package:proj_oprog_front/schema/business_logic/idata_schema.dart';
import 'package:proj_oprog_front/schema/dto/get_schema_response.dart';
import 'package:proj_oprog_front/schema/dto/modify_schema_request.dart';

import '../presenter/iedit_schema_presenter.dart';
import 'iedit_schema_uc.dart';

class EditSchemaUC implements IEditSchemaUC {
  final IDataSchema _service;
  final IEditSchemaPresenter presenter;

  EditSchemaUC(this._service, this.presenter);

  @override
  Future<void> editSchema(ModifySchemaRequest schema, int id) async {
    await _service.editSchema(schema, id);
  }

  @override
  void showEditSchemaView(int id) async{
    GetSchemaResponse dto = await _service.getSchema(id);
    presenter.onShowEditSchemaView(dto, id);
  }
}
