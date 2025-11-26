import '../../shared/dtos/named_id_pair.dart';
abstract class ISchemaView {
  void showSchemaList(List<NamedIdPair> schemas);
  void showError(String message);
}
