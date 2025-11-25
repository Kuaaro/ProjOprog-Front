import '../dto/name_id_pair.dart';

class SchemaListViewModel {
  List<NameIdPair> schemas = [];
  bool isLoading = false;
  String? error;
}
