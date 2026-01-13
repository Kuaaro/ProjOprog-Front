import 'package:flutter/material.dart';
import 'package:proj_oprog_front/schema/event/edit_schema_controller.dart';
import 'package:proj_oprog_front/schema/view_model/edit_schema_view_model.dart';
import 'package:proj_oprog_front/schema/dto/schema_field.dart';

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
    final double screenWidth = MediaQuery.of(context).size.width;
    final double containerWidth = screenWidth * 0.6 < 300
        ? 300.0
        : screenWidth * 0.6;

    final boxDecoration = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: Colors.grey.shade400, width: 1.0),
    );

    return AnimatedBuilder(
      animation: viewModel,
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: Padding(
              padding: const EdgeInsets.all(70.0),
              child: const Text('Edit Schema'),
            ),
          ),
          body: Align(
            alignment: Alignment.topLeft,
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(
                left: 80.0,
                top: 40.0,
                right: 24.0,
                bottom: 40.0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: containerWidth,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 8.0, left: 4.0),
                          child: Text(
                            'Schema Name',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Container(
                          decoration: boxDecoration,
                          padding: const EdgeInsets.all(16.0),
                          child: TextField(
                            controller: viewModel.schemaNameController,
                            decoration: const InputDecoration(
                              labelText: 'Enter name here',
                              border: UnderlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 32),

                  SizedBox(
                    width: containerWidth,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 8.0, left: 4.0),
                          child: Text(
                            'Schema Fields',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Container(
                          decoration: boxDecoration,
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: viewModel.fieldRows.length + 1,
                                itemBuilder: (context, index) {
                                  if (index == viewModel.fieldRows.length) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 16.0,
                                      ),
                                      child: Center(
                                        child: ElevatedButton.icon(
                                          onPressed: viewModel.addField,
                                          icon: const Icon(Icons.add),
                                          label: const Text('Add Field'),
                                        ),
                                      ),
                                    );
                                  }

                                  final row = viewModel.fieldRows[index];

                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: TextField(
                                            controller: row.nameController,
                                            decoration: const InputDecoration(
                                              labelText: 'Field Name',
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Expanded(
                                          child:
                                              DropdownButtonFormField<SchemaFieldType>(
                                                value: row.selectedType,
                                                decoration:
                                                    const InputDecoration(
                                                      labelText: 'Type',
                                                    ),
                                                items: SchemaFieldType.values
                                                    .map((type) =>
                                                        DropdownMenuItem(
                                                          value: type,
                                                          child: Text(type.displayName),
                                                        ))
                                                    .toList(),
                                                onChanged: (SchemaFieldType? newValue) {
                                                  if (newValue != null) {
                                                    viewModel.updateFieldType(index, newValue);
                                                  }
                                                },
                                              ),
                                        ),
                                        IconButton(
                                          icon: const Icon(Icons.remove_circle),
                                          onPressed: () =>
                                              viewModel.removeField(index),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                              const SizedBox(height: 16),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  OutlinedButton(
                                    onPressed: () => controller.cancel(),
                                    child: const Text('Cancel'),
                                  ),
                                  const SizedBox(width: 16),
                                  ElevatedButton(
                                    onPressed: () async =>
                                        await controller.saveSchema(),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFF66C266),
                                      foregroundColor: Colors.white,
                                    ),
                                    child: const Text('Save'),
                                  ),
                                ],
                              ),

                              if (viewModel.status.isNotEmpty)
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
