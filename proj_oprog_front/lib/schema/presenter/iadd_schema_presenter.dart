import '../dto/schema_dto.dart';

abstract class IAddSchemaPresenter {
  void onSchemaAdded(SchemaDto schema);
  void onError(String error);
  void onShowAddSchemaView();
}
