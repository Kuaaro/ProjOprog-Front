import 'package:flutter/material.dart';
import 'package:proj_oprog_front/schema/dto/schema_field.dart';
import 'package:proj_oprog_front/schema/event/edit_schema_controller.dart';
import 'package:proj_oprog_front/schema/view_model/edit_schema_view_model.dart';

class EditSchemaView extends StatelessWidget {
  final EditSchemaController controller;
  final EditSchemaViewModel viewModel;

  const EditSchemaView({
    super.key,
    required this.controller,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: viewModel,
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(title: const Text('Edit Schema')),
          body: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: viewModel.schemaNameController,
                  decoration: const InputDecoration(labelText: 'Schema Name'),
                ),
                const SizedBox(height: 24),
                Expanded(
                  child: ListView.builder(
                    itemCount: viewModel.fields.length + 1,
                    itemBuilder: (context, index) {
                      if (index == viewModel.fields.length) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Center(
                            child: ElevatedButton.icon(
                              onPressed: () => viewModel.addField(
                                SchemaField(name: '', type: '', count: ''),
                              ),
                              icon: const Icon(Icons.add),
                              label: const Text('Add Field'),
                            ),
                          ),
                        );
                      }

                      final field = viewModel.fields[index];
                      return Row(
                        key: ValueKey(field),
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: const InputDecoration(
                                labelText: 'Field Name',
                              ),
                              controller: viewModel.nameControllers[index],
                              onChanged: (val) {
                                viewModel.updateField(
                                  index,
                                  SchemaField(
                                    name: val,
                                    type: viewModel.typeControllers[index].text,
                                    count: field.count,
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              decoration: const InputDecoration(
                                labelText: 'Type',
                              ),
                              controller: viewModel.typeControllers[index],
                              onChanged: (val) {
                                viewModel.updateField(
                                  index,
                                  SchemaField(
                                    name: viewModel.nameControllers[index].text,
                                    type: val,
                                    count: field.count,
                                  ),
                                );
                              },
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.remove_circle),
                            onPressed: () => viewModel.removeField(index),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: controller.saveSchema,
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
                      child: const Text('Submit'),
                    ),
                  ],
                ),
                if (viewModel.status == 'Error')
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Text(
                      viewModel.status,
                      style: const TextStyle(color: Colors.green),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
