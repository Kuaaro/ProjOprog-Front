import 'package:flutter/material.dart';

class CreateCatalogViewModel extends ChangeNotifier {
  String name;
  String description;
  int parentId;

  CreateCatalogViewModel({required this.parentId})
    : name = '',
      description = '';

  void refresh(int parentId) {
    name = '';
    description = '';
    parentId = parentId;
  }

  void notifyChanges() {
    notifyListeners();
  }
}
