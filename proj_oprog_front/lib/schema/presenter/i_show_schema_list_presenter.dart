import 'package:proj_oprog_front/schema/dto/get_schema_list_response.dart';

abstract class IShowSchemaListPresenter {
  void showSchemaList(GetSchemaListResponse schemas);
  void showError(String message);
}
