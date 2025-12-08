import '../../shared/dtos/named_id_pair.dart';
import 'package:flutter/material.dart'; 

class ShowSchemaListViewModel extends ChangeNotifier  {
  List<NamedIdPair> schemas = [];
  bool isLoading = false;
  String? error;

  void clear() {
    schemas = [];
    isLoading = false;
    error = null;
    notifyListeners();
  }

  void setSchemas(List<NamedIdPair> receivedSchemas) {
    schemas = receivedSchemas;
    notifyListeners();
  }
  
}
