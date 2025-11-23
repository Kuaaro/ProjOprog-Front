import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:proj_oprog_front/metadata_manager/utility/igeneral_view.dart';
import 'package:proj_oprog_front/metadata_manager/view/catalog/event/icatalog_event_controller.dart';
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
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              ElevatedButton.icon(
                onPressed: () => {},
                icon: const Icon(Icons.create_new_folder),
                label: const Text('New'),
              ),
              const SizedBox(width: 16),
            ],
          ),
          const SizedBox(height: 20),
          // Lista
          widget.viewModel.catalogs.isEmpty && widget.viewModel.datasets.isEmpty
              ? const Center(
                  child: Text('No catalogs or datasets in this folder'),
                )
              : Column(
                  // Changed from ListView wrapped in Expanded
                  children: [
                    ...widget.viewModel.catalogs.map(
                      (catalog) => Card(
                        child: ListTile(
                          leading: const Icon(Icons.folder, color: Colors.blue),
                          title: Text(catalog.name),
                          subtitle: Text('Catalog ID: ${catalog.id}'),
                          trailing: const Icon(Icons.arrow_forward_ios),
                          onTap: () => GetIt.instance<ICatalogEventController>()
                              .onCatalogPressed(catalog.id),
                        ),
                      ),
                    ),
                    ...widget.viewModel.datasets.map(
                      (dataset) => Card(
                        child: ListTile(
                          leading: const Icon(
                            Icons.description,
                            color: Colors.green,
                          ),
                          title: Text(dataset.name),
                          subtitle: Text('Dataset ID: ${dataset.id}'),
                        ),
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
