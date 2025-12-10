import 'package:flutter/material.dart';
import 'package:proj_oprog_front/schema/event/show_schema_list_controller.dart';
import 'package:proj_oprog_front/schema/view_model/show_schema_list_view_model.dart';

class ShowSchemaListView extends StatelessWidget {
  final ShowSchemaListViewModel viewModel;
  final ShowSchemaListController controller;

  const ShowSchemaListView({
    super.key,
    required this.viewModel,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    if (viewModel.isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (viewModel.error != null) {
      return Scaffold(
        body: Center(
          child: Text(
            'Error: ${viewModel.error}',
            style: const TextStyle(color: Colors.red),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Data Schemas',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w400,
                    color: Colors.black87,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () => controller.showAddSchema(),
                  icon: const Icon(Icons.add, size: 18),
                  label: const Text('New Schema'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF66C266),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),

            Expanded(
              child: ListView.separated(
                itemCount: viewModel.schemas.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final schema = viewModel.schemas[index];

                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 16,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.grey.shade300, // Light gray border
                        width: 1,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Schema Name
                        Text(
                          schema.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                        // Edit Button
                        OutlinedButton(
                          onPressed: ()=>controller.showEditSchema(schema.id),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.black87,
                            side: BorderSide(color: Colors.grey.shade300),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 12,
                            ),
                          ),
                          child: const Text('Edit'),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
