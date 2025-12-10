import 'package:flutter/material.dart';
import 'package:proj_oprog_front/schema/dto/schema_field.dart';
import '../dto/schema_dto.dart';

class EditSchemaViewModel extends ChangeNotifier {
  SchemaDto? schema;
  String status = '';
  TextEditingController schemaNameController = TextEditingController();
  List<SchemaField> fields = [];
  List<TextEditingController> nameControllers = [];  
  List<TextEditingController> typeControllers = [];  

  void setSchema(SchemaDto schema) {
    this.schema = schema;
    schemaNameController.text = schema.name;
    notifyListeners();
  }

  void setFields(List<SchemaField> fields) {
    this.fields = fields;
    nameControllers = fields.map((f) => TextEditingController(text: f.name)).toList();
    typeControllers = fields.map((f) => TextEditingController(text: f.type)).toList();
    notifyListeners();
  }

  void setStatus(String status) {
    this.status = status;
    notifyListeners();
  }

  void addField(SchemaField field) {
    fields.add(field);
    nameControllers.add(TextEditingController(text: field.name));
    typeControllers.add(TextEditingController(text: field.type));
    notifyListeners();
  }

  void removeField(int index) {
    if (index >= 0 && index < fields.length) {
      fields.removeAt(index);
      nameControllers[index].dispose();
      typeControllers[index].dispose();
      nameControllers.removeAt(index);
      typeControllers.removeAt(index);
      notifyListeners();
    }
  }

  void updateField(int index, SchemaField field) {
    if (index >= 0 && index < fields.length) {
      fields[index] = field;
    }
  }

  void clearFields() {
    fields.clear();
    for (var c in nameControllers) c.dispose();
    for (var c in typeControllers) c.dispose();
    nameControllers.clear();
    typeControllers.clear();
  
    schemaNameController.clear();
    
    notifyListeners();
  }

  @override
  void dispose() {
    schemaNameController.clear();
    schemaNameController.dispose();
    for (var c in nameControllers) c.dispose();
    for (var c in typeControllers) c.dispose();
    super.dispose();
  }
}