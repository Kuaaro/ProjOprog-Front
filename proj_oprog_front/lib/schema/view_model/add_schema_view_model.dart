import 'package:flutter/material.dart';
import 'package:proj_oprog_front/schema/dto/schema_field.dart';
import 'package:proj_oprog_front/schema/view_model/schema_field_row.dart';
import '../dto/schema_dto.dart';

class AddSchemaViewModel extends ChangeNotifier {
  SchemaDto? schema;
  String status = '';

  final TextEditingController schemaNameController = TextEditingController();
  final List<SchemaFieldRow> fieldRows = [];

  @override
  void dispose() {
    schemaNameController.dispose();
    for (var row in fieldRows) {
      row.dispose();
    }
    super.dispose();
  }

  List<SchemaField> get fields => fieldRows
      .map(
        (row) =>
            SchemaField(name: row.nameController.text, type: row.selectedType),
      )
      .toList();

  void addField() {
    fieldRows.add(SchemaFieldRow());
    notifyListeners();
  }

  void removeField(int index) {
    if (index >= 0 && index < fieldRows.length) {
      fieldRows[index].dispose();
      fieldRows.removeAt(index);
      notifyListeners();
    }
  }

  void setStatus(String status) {
    this.status = status;
    notifyListeners();
  }

  void setSchema(SchemaDto schema) {
    this.schema = schema;
  }
}
