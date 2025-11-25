import '../dto/name_id_pair.dart';

abstract class IDataSchema {
  Future<List<NameIdPair>> getSchemaList();
}
