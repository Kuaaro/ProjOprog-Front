import 'package:flutter/material.dart';

class SchemaFieldRow {
  final TextEditingController nameController;
  final TextEditingController typeController;

  SchemaFieldRow({String name = '', String type = ''})
      : nameController = TextEditingController(text: name),
        typeController = TextEditingController(text: type);

  void dispose() {
    nameController.dispose();
    typeController.dispose();
  }
}