import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:proj_oprog_front/catalog/event/icreate_catalog_event_controller.dart';
import 'package:proj_oprog_front/catalog/view_model/create_catalog_view_model.dart';

class CreateCatalogView extends StatelessWidget {
  final CreateCatalogViewModel viewModel;

  const CreateCatalogView(this.viewModel, {super.key});

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
              Text(
                'Create New Catalog',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 20),

              // Form
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Name field
                      TextField(
                        decoration: const InputDecoration(
                          labelText: 'Name',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          viewModel.name = value;
                          viewModel.notifyChanges();
                        },
                      ),
                      const SizedBox(height: 16),

                      // Description field
                      TextField(
                        decoration: const InputDecoration(
                          labelText: 'Description',
                          border: OutlineInputBorder(),
                        ),
                        maxLines: 3,
                        onChanged: (value) {
                          viewModel.description = value;
                          viewModel.notifyChanges();
                        },
                      ),
                      const SizedBox(height: 20),

                      // Buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              GetIt.instance<ICreateCatalogEventController>()
                                  .onCancelPressed();
                            },
                            child: const Text('Cancel'),
                          ),
                          const SizedBox(width: 8),
                          ElevatedButton(
                            onPressed: () {
                              GetIt.instance<ICreateCatalogEventController>()
                                  .onNewCatalogSavePressed();
                            },
                            child: const Text('Save'),
                          ),
                          // mmm flutter closing parenthesis robi brrrr
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
