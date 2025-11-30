import '../dto/schema_dto.dart';

import '../../shared/dtos/named_id_pair.dart';

abstract class IDataSchema {
  Future<List<NamedIdPair>> getSchemaList();
  Future<void> addSchema(SchemaDto schema);
  Future<void> editSchema(SchemaDto schema);
  Future<SchemaDto> getSchema(int id);
}
