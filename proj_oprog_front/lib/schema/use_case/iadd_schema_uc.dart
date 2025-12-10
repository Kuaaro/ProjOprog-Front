import 'package:proj_oprog_front/schema/dto/create_schema_request.dart';

abstract class IAddSchemaUC {
  Future<void> addSchema(CreateSchemaRequest schema);
  void showAddSchemaView();
  void onError(String error);
}
