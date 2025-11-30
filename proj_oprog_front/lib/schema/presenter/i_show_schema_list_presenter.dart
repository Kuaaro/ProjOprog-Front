import '../../shared/dtos/named_id_pair.dart';
abstract class IShowSchemaListPresenter {
  void showSchemaList(List<NamedIdPair> schemas);
  void showError(String message);
}
