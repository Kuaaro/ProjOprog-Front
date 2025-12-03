import '../../shared/dtos/named_id_pair.dart';

class ShowSchemaListViewModel {
  List<NamedIdPair> schemas = [];
  bool isLoading = false;
  String? error;
}
