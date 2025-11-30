import '../dto/schema_dto.dart';

abstract class IEditSchemaUC {
  Future<void> editSchema(SchemaDto schema);
  void showEditSchemaView(int id);
}
