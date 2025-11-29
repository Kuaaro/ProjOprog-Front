import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:proj_oprog_front/catalog/event/icatalog_event_controller.dart';
import 'package:proj_oprog_front/catalog/view_model/catalog_list_view_model.dart';
import 'package:proj_oprog_front/dataset/event/idataset_event_controller.dart';
import 'package:proj_oprog_front/shared/dtos/named_id_pair.dart';

class VCatalog extends StatelessWidget {
  final CatalogListViewModel viewModel;

  VCatalog(this.viewModel);

  String getPath() {
    if (viewModel.pathStack.isEmpty) {
      return '/';
    }
    return '/' + viewModel.pathStack.map((item) => item.name).join('/');
  }

  NamedIdPair? getPrevious() {
    return viewModel.pathStack.length < 2
        ? null
        : viewModel.pathStack[viewModel.pathStack.length - 2];
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: viewModel,
      builder: (context, child) {
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
                  // Back-button
                  if (viewModel.pathStack.isNotEmpty) ...[
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () => GetIt.instance<ICatalogEventController>()
                          .onPreviousCatalogPressed(getPrevious()),
                    ),
                    const SizedBox(width: 8),
                  ],
                  // Path
                  Expanded(
                    child: Text(
                      getPath(),
                      style: Theme.of(context).textTheme.headlineSmall,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Lista
              viewModel.catalogs.isEmpty && viewModel.datasets.isEmpty
                  ? const Center(
                      child: Text('No catalogs or datasets in this folder'),
                    )
                  : Column(
                      children: [
                        ...viewModel.catalogs.map(
                          (catalog) => Card(
                            child: ListTile(
                              leading: const Icon(
                                Icons.folder,
                                color: Colors.blue,
                              ),
                              title: Text(catalog.name),
                              subtitle: Text('Catalog ID: ${catalog.id}'),
                              trailing: const Icon(Icons.arrow_forward_ios),
                              onTap: () =>
                                  GetIt.instance<ICatalogEventController>()
                                      .onCatalogPressed(catalog),
                            ),
                          ),
                        ),
                        ...viewModel.datasets.map(
                          (dataset) => Card(
                            child: ListTile(
                              leading: const Icon(
                                Icons.description,
                                color: Colors.green,
                              ),
                              title: Text(dataset.name),
                              subtitle: Text('Dataset ID: ${dataset.id}'),
                              trailing: const Icon(Icons.edit),
                              onTap: () => GetIt.instance<IDatasetEventController>()
                                  .onDatasetPressed(dataset.id),
                            ),
                          ),
                        ),
                      ],
                    ),
            ],
          ),
        );
      },
    );
  }
}
