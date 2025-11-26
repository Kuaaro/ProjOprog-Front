import '../../shared/dtos/named_id_pair.dart';

abstract class IDataSchema {
  Future<List<NamedIdPair>> getSchemaList();
}
