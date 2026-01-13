import 'package:flutter/material.dart';

class SchemaFieldRow {
  final TextEditingController nameController;
  String selectedType;

  SchemaFieldRow({String name = '', String type = 'int'})
    : nameController = TextEditingController(text: name),
      selectedType = type;

  void dispose() {
    nameController.dispose();
  }
}
