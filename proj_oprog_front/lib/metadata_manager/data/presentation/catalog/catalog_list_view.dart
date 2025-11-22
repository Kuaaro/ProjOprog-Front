import 'package:flutter/material.dart';
import 'package:proj_oprog_front/main.dart';
import 'package:proj_oprog_front/metadata_manager/data/model/dtos/get_catalog_children_response.dart';
import 'package:proj_oprog_front/metadata_manager/data/services/catalog_service.dart';
import 'package:proj_oprog_front/metadata_manager/data/presentation/catalog/interface/icatalog_list_controller.dart';
import 'package:proj_oprog_front/metadata_manager/data/presentation/catalog/catalog_list_controller.dart';
import 'package:proj_oprog_front/metadata_manager/data/presentation/catalog/interface/icatalog_list_view.dart';

class CatalogListView extends StatefulWidget {
  const CatalogListView({super.key});

  @override
  State<CatalogListView> createState() => _CatalogListViewState();
}

class _CatalogListViewState extends State<CatalogListView>
    implements ICatalogListView {
  late ICatalogListController _controller;

  // Stan widoku
  bool _isLoading = false;
  String? _error;
  GetCatalogChildrenResponse? _response;
  String _currentPath = '/';

  @override
  void initState() {
    super.initState();

    _controller = CatalogListController(view: this, service: locator());

    _controller.loadCatalogChildren(0);
  }

  @override
  void show(GetCatalogChildrenResponse response, String currentPath) {
    setState(() {
      _response = response;
      _currentPath = currentPath;
      _isLoading = false;
      _error = null;
    });
  }

  @override
  void showLoading() {
    setState(() {
      _isLoading = true;
      _error = null;
    });
  }

  @override
  void showError(String error) {
    setState(() {
      _error = error;
      _isLoading = false;
    });
  }

  // UI rendering
  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Error: $_error', style: const TextStyle(color: Colors.red)),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _controller.loadCatalogChildren(0),
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    if (_response == null) {
      return const Center(child: Text('No data'));
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
                onPressed: () => _controller.onNewCatalogPressed(),
                icon: const Icon(Icons.create_new_folder),
                label: const Text('New'),
              ),
              const SizedBox(width: 16),

              if ((_controller as CatalogListController).canGoBack()) ...[
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => _controller.onBackPressed(),
                ),
                const SizedBox(width: 8),
              ],

              Expanded(
                child: Text(
                  _currentPath,
                  style: Theme.of(context).textTheme.headlineSmall,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Lista
          Expanded(
            child: _response!.catalogs.isEmpty && _response!.datasets.isEmpty
                ? const Center(
                    child: Text('No catalogs or datasets in this folder'),
                  )
                : ListView(
                    children: [
                      ..._response!.catalogs.map(
                        (catalog) => Card(
                          child: ListTile(
                            leading: const Icon(
                              Icons.folder,
                              color: Colors.blue,
                            ),
                            title: Text(catalog.name),
                            subtitle: Text('Catalog ID: ${catalog.id}'),
                            trailing: const Icon(Icons.arrow_forward_ios),
                            onTap: () => _controller.onCatalogSelected(
                              catalog.id,
                              catalog.name,
                            ),
                          ),
                        ),
                      ),

                      ..._response!.datasets.map(
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
          ),
        ],
      ),
    );
  }
}
