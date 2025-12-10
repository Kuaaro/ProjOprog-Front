import 'package:proj_oprog_front/schema/dto/get_schema_response.dart';
import 'package:proj_oprog_front/schema/dto/modify_schema_request.dart';


abstract class IEditSchemaPresenter {
  void onShowEditSchemaView(GetSchemaResponse schema, int id);
  void onSchemaEdited(ModifySchemaRequest schema);
  void onError(String error);
}
