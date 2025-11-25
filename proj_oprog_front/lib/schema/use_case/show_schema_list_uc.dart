import 'package:proj_oprog_front/schema/business_logic/idata_schema.dart';
import 'package:proj_oprog_front/schema/presenter/ipschema.dart';
import 'package:proj_oprog_front/schema/use_case/ishow_schema_list_uc.dart';

class ShowSchemaListUC implements IShowSchemaListUC {
  final IDataSchema dataSchemaService;
  final IPSchema presenter;

  ShowSchemaListUC(this.dataSchemaService, this.presenter);

  @override
  Future<void> showSchemaListUCD() async {
    try {
      final schemas = await dataSchemaService.getSchemaList();
      
      presenter.showSchemaList(schemas);
      
    } catch (e) {
      presenter.showError("Failed to load schemas");
    }
  }
}
