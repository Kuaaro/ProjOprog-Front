import 'package:proj_oprog_front/schema/business_logic/idata_schema.dart';
import 'package:proj_oprog_front/schema/dto/create_schema_request.dart';

import '../presenter/iadd_schema_presenter.dart';
import 'iadd_schema_uc.dart';

class AddSchemaUC implements IAddSchemaUC {
  final IDataSchema _service;
  final IAddSchemaPresenter presenter;

  AddSchemaUC(this._service, this.presenter);

  @override
  Future<void> addSchema(CreateSchemaRequest schema) async {
    await _service.addSchema(schema);
  }
  
  @override
  void showAddSchemaView() {
    presenter.onShowAddSchemaView();
  }
  
  @override
  void onError(String error) {
    presenter.onError(error);
  }
}
