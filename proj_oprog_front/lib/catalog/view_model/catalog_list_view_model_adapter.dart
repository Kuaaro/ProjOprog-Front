import 'package:proj_oprog_front/catalog/dto/show_catalog_dto.dart';
import 'package:proj_oprog_front/catalog/view_model/catalog_list_view_model.dart';
import 'package:proj_oprog_front/shared/dtos/named_id_pair.dart';

class CatalogListViewModelAdapter {
  final CatalogListViewModel viewModel;

  CatalogListViewModelAdapter(this.viewModel);

  GetCatalogChildrenResponse getData() {
    return GetCatalogChildrenResponse(
      catalogs: viewModel.catalogs,
      datasets: viewModel.datasets,
    );
  }

  void setData(GetCatalogChildrenResponse dto) {
    viewModel.catalogs
      ..clear()
      ..addAll(dto.catalogs);
    viewModel.datasets
      ..clear()
      ..addAll(dto.datasets);

    viewModel.notifyChanges();
  }

  void pushPath(NamedIdPair item) {
    viewModel.pathStack.add(item);
    viewModel.notifyChanges();
  }

  List<NamedIdPair> getPath() {
    return viewModel.pathStack;
  }

  NamedIdPair? popPath() {
    if (viewModel.pathStack.isEmpty) {
      return null;
    }
    final result = viewModel.pathStack.removeLast();
    viewModel.notifyChanges();
    return result;
  }

  void clearPath() {
    viewModel.pathStack.clear();
    viewModel.notifyChanges();
  }
}
