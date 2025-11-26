import '../../shared/dtos/named_id_pair.dart';

class SchemaListViewModel {
  List<NamedIdPair> schemas = [];
  bool isLoading = false;
  String? error;
}
