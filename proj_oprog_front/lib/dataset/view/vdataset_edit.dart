import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:proj_oprog_front/dataset/dto/distribution_dto.dart';
import 'package:proj_oprog_front/dataset/event/idataset_event_controller.dart';
import 'package:proj_oprog_front/dataset/view_model/dataset_edit_view_model.dart';

class VDatasetEdit extends StatelessWidget {
  final DatasetEditViewModel viewModel;

  const VDatasetEdit(this.viewModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: viewModel,
      builder: (context, child) {
        if (viewModel.isLoading && viewModel.dataset == null) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (viewModel.errorMessage != null && viewModel.dataset == null) {
          return Scaffold(
            appBar: AppBar(title: const Text('Error')),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    viewModel.errorMessage!,
                    style: const TextStyle(color: Colors.red),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => context.go('/catalog'),
                    child: const Text('Back to Catalog'),
                  ),
                ],
              ),
            ),
          );
        }

        if (viewModel.dataset == null) {
          return const Scaffold(
            body: Center(child: Text('No dataset selected')),
          );
        }

        return Scaffold(
          appBar: AppBar(
            title: Text('Edit: ${viewModel.dataset!.name}'),
            actions: [
              if (viewModel.isLoading)
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                ),
            ],
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (viewModel.errorMessage != null)
                  Container(
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: Colors.red.shade100,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.red),
                    ),
                    child: Text(
                      viewModel.errorMessage!,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                _buildTextField(
                  label: 'Name',
                  initialValue: viewModel.dataset!.name,
                  onChanged: (value) => viewModel.updateName(value),
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  label: 'Description',
                  initialValue: viewModel.dataset!.desc,
                  onChanged: (value) => viewModel.updateDesc(value),
                  maxLines: 4,
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  label: 'Contact Point',
                  initialValue: viewModel.dataset!.contactPoint,
                  onChanged: (value) => viewModel.updateContactPoint(value),
                ),
                const SizedBox(height: 16),
                _buildKeywordsField(context),
                const SizedBox(height: 16),
                _buildDistributionsField(context),
                const SizedBox(height: 16),
                _buildNumberField(
                  label: 'Schema ID',
                  initialValue: viewModel.dataset!.schemaId.toString(),
                  onChanged: (value) {
                    final id = int.tryParse(value);
                    if (id != null) {
                      viewModel.updateSchemaId(id);
                    }
                  },
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: viewModel.isLoading
                            ? null
                            : () {
                                GetIt.instance<IDatasetEventController>()
                                    .onCancelPressed();
                                context.go('/catalog');
                              },
                        child: const Text('Cancel'),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: viewModel.isLoading
                            ? null
                            : () {
                                GetIt.instance<IDatasetEventController>()
                                    .onSavePressed();
                              },
                        child: const Text('Save'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTextField({
    required String label,
    required String initialValue,
    required ValueChanged<String> onChanged,
    int maxLines = 1,
  }) {
    return TextFormField(
      initialValue: initialValue,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      maxLines: maxLines,
      onChanged: onChanged,
    );
  }

  Widget _buildNumberField({
    required String label,
    required String initialValue,
    required ValueChanged<String> onChanged,
  }) {
    return TextFormField(
      initialValue: initialValue,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      keyboardType: TextInputType.number,
      onChanged: onChanged,
    );
  }

  Widget _buildKeywordsField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Keywords',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            ...viewModel.dataset!.keywords.map(
              (keyword) => Chip(
                label: Text(keyword),
                onDeleted: () {
                  final newKeywords = List<String>.from(
                    viewModel.dataset!.keywords,
                  )..remove(keyword);
                  viewModel.updateKeywords(newKeywords);
                },
              ),
            ),
            InputChip(
              label: const Text('+ Add keyword'),
              onPressed: () {
                _showAddKeywordDialog(context);
              },
            ),
          ],
        ),
      ],
    );
  }

  void _showAddKeywordDialog(BuildContext context) {
    final controller = TextEditingController();

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Add Keyword'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            labelText: 'Keyword',
            border: OutlineInputBorder(),
          ),
          autofocus: true,
          onSubmitted: (value) {
            if (value.trim().isNotEmpty) {
              final newKeywords = List<String>.from(
                viewModel.dataset!.keywords,
              )..add(value.trim());
              viewModel.updateKeywords(newKeywords);
              Navigator.of(dialogContext).pop();
            }
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              if (controller.text.trim().isNotEmpty) {
                final newKeywords = List<String>.from(
                  viewModel.dataset!.keywords,
                )..add(controller.text.trim());
                viewModel.updateKeywords(newKeywords);
                Navigator.of(dialogContext).pop();
              }
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  Widget _buildDistributionsField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Distributions',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        ...viewModel.dataset!.distributions.asMap().entries.map(
          (entry) {
            final index = entry.key;
            final distribution = entry.value;
            return Card(
              margin: const EdgeInsets.only(bottom: 8),
              child: ExpansionTile(
                title: Text('Distribution ${distribution.distributionId}'),
                subtitle: Text(distribution.accessURL),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        _buildTextField(
                          label: 'Access URL',
                          initialValue: distribution.accessURL,
                          onChanged: (value) {
                            final newDistributions = List<DistributionDto>.from(
                              viewModel.dataset!.distributions,
                            );
                            newDistributions[index] = DistributionDto(
                              distributionId: distribution.distributionId,
                              accessURL: value,
                              description: distribution.description,
                              format: distribution.format,
                              availability: distribution.availability,
                            );
                            viewModel.updateDistributions(newDistributions);
                          },
                        ),
                        const SizedBox(height: 16),
                        _buildTextField(
                          label: 'Description',
                          initialValue: distribution.description,
                          onChanged: (value) {
                            final newDistributions = List<DistributionDto>.from(
                              viewModel.dataset!.distributions,
                            );
                            newDistributions[index] = DistributionDto(
                              distributionId: distribution.distributionId,
                              accessURL: distribution.accessURL,
                              description: value,
                              format: distribution.format,
                              availability: distribution.availability,
                            );
                            viewModel.updateDistributions(newDistributions);
                          },
                          maxLines: 2,
                        ),
                        const SizedBox(height: 16),
                        _buildTextField(
                          label: 'Format',
                          initialValue: distribution.format,
                          onChanged: (value) {
                            final newDistributions = List<DistributionDto>.from(
                              viewModel.dataset!.distributions,
                            );
                            newDistributions[index] = DistributionDto(
                              distributionId: distribution.distributionId,
                              accessURL: distribution.accessURL,
                              description: distribution.description,
                              format: value,
                              availability: distribution.availability,
                            );
                            viewModel.updateDistributions(newDistributions);
                          },
                        ),
                        const SizedBox(height: 16),
                        CheckboxListTile(
                          title: const Text('Availability'),
                          value: distribution.availability,
                          onChanged: (value) {
                            if (value != null) {
                              final newDistributions = List<DistributionDto>.from(
                                viewModel.dataset!.distributions,
                              );
                              newDistributions[index] = DistributionDto(
                                distributionId: distribution.distributionId,
                                accessURL: distribution.accessURL,
                                description: distribution.description,
                                format: distribution.format,
                                availability: value,
                              );
                              viewModel.updateDistributions(newDistributions);
                            }
                          },
                        ),
                        const SizedBox(height: 8),
                        OutlinedButton.icon(
                          onPressed: () {
                            final newDistributions = List<DistributionDto>.from(
                              viewModel.dataset!.distributions,
                            )..removeAt(index);
                            viewModel.updateDistributions(newDistributions);
                          },
                          icon: const Icon(Icons.delete),
                          label: const Text('Remove Distribution'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        OutlinedButton.icon(
          onPressed: () {
            final newDistributions = List<DistributionDto>.from(
              viewModel.dataset!.distributions,
            )..add(DistributionDto(
                distributionId: -1,
                accessURL: '',
                description: '',
                format: '',
                availability: false,
              ));
            viewModel.updateDistributions(newDistributions);
          },
          icon: const Icon(Icons.add),
          label: const Text('Add Distribution'),
        ),
      ],
    );
  }
}