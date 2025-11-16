import 'package:flutter/material.dart';
import 'package:proj_oprog_front/metadata_manager/data/services/catalog.dart';
import 'package:proj_oprog_front/metadata_manager/data/model/dtos/get_catalog_children_response.dart';

class CatalogContent extends StatefulWidget {
  const CatalogContent({super.key});

  @override
  State<CatalogContent> createState() => _CatalogContentState();
}

class _CatalogContentState extends State<CatalogContent> {
  final CatalogService _catalogService = CatalogService();
  GetCatalogChildrenResponse? _response;
  bool _isLoading = false;
  String? _error;

  // Stack do trzymania historii nawigacji
  List<int> _catalogIdStack = [0];
  List<String> _pathNames = [];

  @override
  void initState() {
    super.initState();
    _loadCatalogChildren(0);
  }

  Future<void> _loadCatalogChildren(int id, {String? catalogName}) async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final response = await _catalogService.getCatalogChildren(id);
      setState(() {
        _response = response;

        if (catalogName != null) {
          _catalogIdStack.add(id);
          _pathNames.add(catalogName);
        }

        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  void _goBack() {
    if (_catalogIdStack.length > 1) {
      _catalogIdStack.removeLast();
      _pathNames.removeLast();

      final previousId = _catalogIdStack.last;

      setState(() {
        _isLoading = true;
        _error = null;
      });

      _catalogService
          .getCatalogChildren(previousId)
          .then((response) {
            setState(() {
              _response = response;
              _isLoading = false;
            });
          })
          .catchError((e) {
            setState(() {
              _error = e.toString();
              _isLoading = false;
            });
          });
    }
  }

  String _getCurrentPath() {
    if (_pathNames.isEmpty) {
      return '/';
    }
    return '/${_pathNames.join('/')}';
  }

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
              onPressed: () {
                final currentId = _catalogIdStack.last;
                setState(() {
                  _isLoading = true;
                  _error = null;
                });
                _catalogService
                    .getCatalogChildren(currentId)
                    .then((response) {
                      setState(() {
                        _response = response;
                        _isLoading = false;
                      });
                    })
                    .catchError((e) {
                      setState(() {
                        _error = e.toString();
                        _isLoading = false;
                      });
                    });
              },
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
                onPressed: () {
                  // TODO: implement create new catalog
                },
                icon: const Icon(Icons.create_new_folder),
                label: const Text('New'),
              ),
              const SizedBox(width: 16),

              // Back button
              if (_catalogIdStack.length > 1) ...[
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: _goBack,
                ),
                const SizedBox(width: 8),
              ],

              // Aktualna ścieżka
              Expanded(
                child: Text(
                  _getCurrentPath(),
                  style: Theme.of(context).textTheme.headlineSmall,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Lista katalogów i datasetów razem
          Expanded(
            child: _response!.catalogs.isEmpty && _response!.datasets.isEmpty
                ? const Center(
                    child: Text('No catalogs or datasets in this folder'),
                  )
                : ListView(
                    children: [
                      // Katalogi
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
                            onTap: () => _loadCatalogChildren(
                              catalog.id,
                              catalogName: catalog.name,
                            ),
                          ),
                        ),
                      ),

                      // Datasety
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
