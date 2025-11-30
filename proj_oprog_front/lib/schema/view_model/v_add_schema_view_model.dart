import '../dto/schema_dto.dart';

class AddSchemaViewModel {
  SchemaDto? schema;
  String status = '';

  void setSchema(SchemaDto schema) {
    this.schema = schema;
  }

  void setStatus(String status) {
    this.status = status;
  }
}
