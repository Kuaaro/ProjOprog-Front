import 'package:flutter/foundation.dart';
import 'package:proj_oprog_front/metadata_manager/data/model/dtos/get_catalog_children_response.dart';

class CatalogListViewModel extends ChangeNotifier {
  final List<NamedIdPair> catalogs;
  final List<NamedIdPair> datasets;
  final List<NamedIdPair> pathStack;

  CatalogListViewModel() : catalogs = [], datasets = [], pathStack = [];

  void notifyChanges() {
    notifyListeners();
  }
}
