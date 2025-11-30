import '../dto/schema_dto.dart';

abstract class IAddSchemaUC {
  Future<void> addSchema(SchemaDto schema);
  void showAddSchemaView();
  void onError(String error);
}
