import '../dto/name_id_pair.dart';
abstract class IPSchema {
  void showSchemaList(List<NameIdPair> schemas);
  void showError(String message);
}
