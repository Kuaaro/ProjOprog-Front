import 'package:proj_oprog_front/schema/dto/create_schema_request.dart';
import 'package:proj_oprog_front/schema/dto/get_schema_list_response.dart';
import 'package:proj_oprog_front/schema/dto/get_schema_response.dart';
import 'package:proj_oprog_front/schema/dto/modify_schema_request.dart';


abstract class IDataSchema {
  Future<GetSchemaListResponse> getSchemaList();
  Future<void> addSchema(CreateSchemaRequest schema);
  Future<void> editSchema(ModifySchemaRequest schema, int id);
  Future<GetSchemaResponse> getSchema(int id);
}
