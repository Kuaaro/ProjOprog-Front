import 'package:flutter/foundation.dart';
import 'package:proj_oprog_front/shared/dtos/named_id_pair.dart';

class ShowCatalogViewModel extends ChangeNotifier {
  final List<NamedIdPair> catalogs;
  final List<NamedIdPair> datasets;
  final List<NamedIdPair> pathStack;

  ShowCatalogViewModel() : catalogs = [], datasets = [], pathStack = [];

  void notifyChanges() {
    notifyListeners();
  }
}
