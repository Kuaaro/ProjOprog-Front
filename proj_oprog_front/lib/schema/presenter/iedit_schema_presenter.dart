import '../dto/schema_dto.dart';

abstract class IEditSchemaPresenter {
  void onShowEditSchemaView(SchemaDto schema);
  void onSchemaEdited(SchemaDto schema);
  void onError(String error);
}
