import 'package:proj_oprog_front/metadata_manager/data/model/dtos/get_catalog_children_response.dart';
import 'package:proj_oprog_front/metadata_manager/view/catalog/view_model/catalog_list_view_model.dart';

class CatalogListViewModelAdapter {
  final CatalogListViewModel viewModel;
  CatalogListViewModelAdapter(this.viewModel);

  ShowCatalogDto getData() {
    return ShowCatalogDto(
      catalogs: viewModel.catalogs,
      datasets: viewModel.datasets,
    );
  }

  void setData(ShowCatalogDto dto) {
    viewModel.catalogs
      ..clear()
      ..addAll(dto.catalogs);
    viewModel.datasets
      ..clear()
      ..addAll(dto.datasets);
  }
}
