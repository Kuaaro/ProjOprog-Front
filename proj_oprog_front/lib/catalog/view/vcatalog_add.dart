import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
// Pamiętaj o zaimportowaniu odpowiednich plików z Twojego projektu
import 'package:proj_oprog_front/catalog/event/catalog_event_controller.dart';
import 'package:proj_oprog_front/catalog/view_model/catalog_add_view_model.dart';

class VCatalogAdd extends StatefulWidget {
  final CatalogAddViewModel viewModel;

  const VCatalogAdd(this.viewModel, {Key? key}) : super(key: key);

  @override
  State<VCatalogAdd> createState() => _VCatalogAddState();
}

class _VCatalogAddState extends State<VCatalogAdd> {
  int? _parentCatalogId;

  @override
  void initState() {
    super.initState();
    
    // Pobieranie parentId z URL (np. ?parentId=5)
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final uri = GoRouter.of(context).routerDelegate.currentConfiguration.uri;
      final parentIdParam = uri.queryParameters['parentId'];
      _parentCatalogId = parentIdParam != null ? int.tryParse(parentIdParam) : null;
    });

    
  }

  @override
  void dispose() {
    widget.viewModel.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.viewModel,
      builder: (context, child) {
        // Ekran ładowania
        if (widget.viewModel.isLoading && widget.viewModel.catalog == null) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        // Ekran błędu (jeśli wystąpił przed załadowaniem formularza)
        if (widget.viewModel.errorMessage != null && widget.viewModel.catalog == null) {
          return Scaffold(
            appBar: AppBar(title: const Text('Error')),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.viewModel.errorMessage!,
                    style: const TextStyle(color: Colors.red),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => context.go('/catalog'),
                    child: const Text('Back to catalog'),
                  ),
                ],
              ),
            ),
          );
        }

        final catalog = widget.viewModel.catalog;
        
        if (catalog == null) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        return Scaffold(
          appBar: AppBar(
            title: const Text('Add catalog'),
            actions: [
              if (widget.viewModel.isLoading)
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
                // Wyświetlanie błędu nad formularzem
                if (widget.viewModel.errorMessage != null)
                  Container(
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: Colors.red.shade100,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.red),
                    ),
                    child: Text(
                      widget.viewModel.errorMessage!,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),

                // Pole: Nazwa
                _buildTextField(
                  key: const ValueKey('catalog_name'),
                  label: 'Name',
                  initialValue: catalog.name,
                  onChanged: (value) => widget.viewModel.updateName(value),
                ),
                
                const SizedBox(height: 16),

                // Pole: Opis
                _buildTextField(
                  key: const ValueKey('catalog_desc'),
                  label: 'Description',
                  initialValue: catalog.description, // lub catalog.desc w zależności od DTO
                  onChanged: (value) => widget.viewModel.updateDescription(value),
                  maxLines: 4,
                ),

                const SizedBox(height: 24),

                // Przyciski akcji
                Row(
                  children: [
                    // Przycisk Anuluj
                    Expanded(
                      child: OutlinedButton(
                        onPressed: widget.viewModel.isLoading
                            ? null
                            : () {
                                GetIt.instance<CatalogEventController>().onCancelPressed();
                                context.go('/catalog'); // lub context.pop()
                              },
                        child: const Text('Cancel'),
                      ),
                    ),
                    const SizedBox(width: 16),
                    // Przycisk Utwórz
                    Expanded(
                      child: ElevatedButton(
                        onPressed: widget.viewModel.isLoading
                            ? null
                            : () {
                                final controller = GetIt.instance<CatalogEventController>();
                                // Wywołanie metody tworzenia z przekazaniem ID rodzica
                                controller.onCreateCatalogPressed(_parentCatalogId);
                              },
                        child: const Text('Create'),
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
    Key? key,
    required String label,
    required String initialValue,
    required ValueChanged<String> onChanged,
    int maxLines = 1,
  }) {
    return TextFormField(
      key: key,
      initialValue: initialValue,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      maxLines: maxLines,
      onChanged: onChanged,
    );
  }
}