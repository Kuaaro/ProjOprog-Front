import 'package:flutter/material.dart';
import 'package:proj_oprog_front/metadata_manager/utility/igeneral_view.dart';
import 'package:proj_oprog_front/metadata_manager/view/catalog/view_model/catalog_list_view_model.dart';

class VCatalogListView extends StatefulWidget implements IGeneralView {
  final CatalogListViewModel viewModel;
  final GlobalKey<_VCatalogListViewState> _key =
      GlobalKey<_VCatalogListViewState>();

  VCatalogListView(this.viewModel) : super();

  @override
  GlobalKey<_VCatalogListViewState> get key => _key;

  @override
  void show() {
    _key.currentState?.show();
  }

  @override
  void close() {
    _key.currentState?.close();
  }

  @override
  State<VCatalogListView> createState() => _VCatalogListViewState();
}

class _VCatalogListViewState extends State<VCatalogListView> {
  bool _isVisible = false;

  void show() {
    setState(() {
      _isVisible = true;
    });
  }

  void close() {
    setState(() {
      _isVisible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_isVisible) {
      return const SizedBox.shrink();
    }

    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Catalogs',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        ...widget.viewModel.catalogs.map(
          (catalog) => ListTile(
            title: Text(catalog.name),
            subtitle: Text('ID: ${catalog.id}'),
          ),
        ),
        const Divider(),
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Datasets',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        ...widget.viewModel.datasets.map(
          (dataset) => ListTile(
            title: Text(dataset.name),
            subtitle: Text('ID: ${dataset.id}'),
          ),
        ),
      ],
    );
  }
}
