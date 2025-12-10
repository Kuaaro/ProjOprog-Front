import 'package:proj_oprog_front/schema/dto/modify_schema_request.dart';

abstract class IEditSchemaUC {
  Future<void> editSchema(ModifySchemaRequest schema, int id);
  void showEditSchemaView(int id);
}
