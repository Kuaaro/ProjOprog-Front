import 'package:flutter/material.dart';
import 'package:proj_oprog_front/schema/dto/schema_field.dart';

class SchemaFieldRow {
  final TextEditingController nameController;
  SchemaFieldType selectedType;

  SchemaFieldRow({String name = '', SchemaFieldType type = SchemaFieldType.int})
    : nameController = TextEditingController(text: name),
      selectedType = type;

  void dispose() {
    nameController.dispose();
  }
}
