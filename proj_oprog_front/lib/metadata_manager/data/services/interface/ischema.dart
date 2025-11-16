import 'package:proj_oprog_front/metadata_manager/data/model/dtos/schema_dto.dart';

abstract class ISchema {
  List<SchemaDto> getSchemaList();
  SchemaDto getSchema(int id);
  void createSchema(SchemaDto dto);
  void modifySchema(int id, SchemaDto dto);
}