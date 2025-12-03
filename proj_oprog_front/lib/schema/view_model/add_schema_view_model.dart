
import 'package:flutter/material.dart';
import 'package:proj_oprog_front/schema/dto/schema_field.dart';
import '../dto/schema_dto.dart';

class AddSchemaViewModel extends ChangeNotifier {
  SchemaDto? schema;
  String status = '';
  final TextEditingController schemaNameController = TextEditingController();
  final List<SchemaField> fields = [];

  void setSchema(SchemaDto schema) {
    this.schema = schema;
    notifyListeners();
  }

  void setStatus(String status) {
    this.status = status;
    notifyListeners();
  }

  void addField(SchemaField field) {
    fields.add(field);
    notifyListeners();
  }

  void removeField(int index) {
    if (index >= 0 && index < fields.length) {
      fields.removeAt(index);
      notifyListeners();
    }
  }

  void updateField(int index, SchemaField field) {
    if (index >= 0 && index < fields.length) {
      fields[index] = field;
      notifyListeners();
    }
  }

  void clearFields() {
    fields.clear();
    notifyListeners();
  }
}