import 'package:flutter/material.dart';
import 'package:proj_oprog_front/schema/dto/schema_field.dart';
import 'package:proj_oprog_front/schema/view_model/schema_field_row.dart';
import '../dto/schema_dto.dart';

class EditSchemaViewModel extends ChangeNotifier {
  SchemaDto? schema;
  String status = '';
  int id = -1;

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

  set fields(List<SchemaField> newFields) {
    for (var row in fieldRows) {
      row.dispose();
    }
    fieldRows.clear();
    for (var field in newFields) {
      fieldRows.add(SchemaFieldRow(name: field.name, type: field.type));
    }
    notifyListeners();
  }

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
    schemaNameController.text = schema.name;
  }

  void setId(int id) {
    this.id = id;
  }
}
