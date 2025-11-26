import 'package:flutter/foundation.dart';
import 'package:proj_oprog_front/catalog/dto/show_catalog_dto.dart';

class CatalogListViewModel extends ChangeNotifier {
  final List<NamedIdPair> catalogs;
  final List<NamedIdPair> datasets;
  final List<NamedIdPair> pathStack;

  CatalogListViewModel() : catalogs = [], datasets = [], pathStack = [];

  void notifyChanges() {
    notifyListeners();
  }
}
