import 'package:flutter/material.dart';
import 'package:proj_oprog_front/schema/event/add_schema_controller.dart';
import 'package:proj_oprog_front/schema/view_model/v_add_schema_view_model.dart';

class SchemaField {
  String name;
  String type;
  String count;

  SchemaField({
    required this.name,
    required this.type,
    required this.count,
  });
}


class AddSchemaView extends StatefulWidget {
  final AddSchemaController controller;
  final AddSchemaViewModel viewModel;

  const AddSchemaView({super.key, required this.controller, required this.viewModel});

  @override
  State<AddSchemaView> createState() => _AddSchemaViewState();
}

class _AddSchemaViewState extends State<AddSchemaView> {
  final TextEditingController _schemaNameController = TextEditingController();
  List<SchemaField> fields = [];

  @override
  void initState() {
    super.initState();
    // Optionally initialize with some default fields
    fields = [
      SchemaField(name: "measurement_date", type: "date", count: "1"),
      SchemaField(name: "pm25_value", type: "float", count: "1"),
      SchemaField(name: "location", type: "coordinates", count: "1"),
    ];
  }

  void _addNewField() {
    setState(() {
      fields.add(SchemaField(name: "", type: "", count: "1"));
    });
  }

  void _removeField(int index) {
    setState(() {
      fields.removeAt(index);
    });
  }

  void _submitSchema() async {
    final name = _schemaNameController.text;
    final jsonSchema = _buildJsonSchema();
    await widget.controller.addSchema(name, jsonSchema);
    setState(() {}); // Refresh to show status
  }

  String _buildJsonSchema() {
    // Simple example: convert fields to JSON string
    final fieldList = fields.map((f) => {
      'name': f.name,
      'type': f.type,
      'count': f.count,
    }).toList();
    return fieldList.toString(); // Replace with proper JSON if needed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(color: Colors.grey.shade200, height: 1.0),
        ),
        title: const Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Text(
            "Dodaj Schemat",
            style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w500),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(40.0),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Nazwa schematu",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black87),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _schemaNameController,
                  decoration: _inputDecoration(),
                ),
                const SizedBox(height: 40),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade200),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Pola schematu",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          ElevatedButton.icon(
                            onPressed: _addNewField,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFC47EF6),
                              foregroundColor: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            ),
                            icon: const Icon(Icons.add, size: 18),
                            label: const Text("Dodać pole"),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                        child: Row(
                          children: const [
                            Expanded(flex: 3, child: Text("Pole", style: TextStyle(fontWeight: FontWeight.w600))),
                            SizedBox(width: 15),
                            Expanded(flex: 2, child: Text("Typ", style: TextStyle(fontWeight: FontWeight.w600))),
                            SizedBox(width: 15),
                            Expanded(flex: 1, child: Text("Krotność", style: TextStyle(fontWeight: FontWeight.w600))),
                            SizedBox(width: 15),
                            SizedBox(width: 40, child: Text("Usuń", style: TextStyle(fontWeight: FontWeight.w600))),
                          ],
                        ),
                      ),
                      const Divider(),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: fields.length,
                        separatorBuilder: (c, i) => const SizedBox(height: 10),
                        itemBuilder: (context, index) {
                          final field = fields[index];
                          return _buildFieldRow(index, field);
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: _submitSchema,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  ),
                  child: const Text("Dodaj schemat"),
                ),
                const SizedBox(height: 20),
                Text(widget.viewModel.status, style: const TextStyle(color: Colors.green)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFieldRow(int index, SchemaField field) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          // Field Name Input
          Expanded(
            flex: 3,
            child: TextFormField(
              initialValue: field.name,
              decoration: InputDecoration(
                hintText: "Enter name...",
                contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  field.name = value;
                });
              },
            ),
          ),
          const SizedBox(width: 15),

          // Type Input
          Expanded(
            flex: 2,
            child: TextFormField(
              initialValue: field.type,
              decoration: InputDecoration(
                hintText: "Type...",
                contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  field.type = value;
                });
              },
            ),
          ),
          const SizedBox(width: 15),

          // Count/Multiplicity Input
          Expanded(
            flex: 1,
            child: TextFormField(
              initialValue: field.count,
              decoration: InputDecoration(
                hintText: "Count...",
                contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  field.count = value;
                });
              },
            ),
          ),
          const SizedBox(width: 15),

          // Delete Icon
          SizedBox(
            width: 40,
            child: IconButton(
              icon: const Icon(Icons.delete, color: Colors.black),
              onPressed: () => _removeField(index),
            ),
          ),
        ],
      ),
    );
  }

  // Helper for generic input styling
  InputDecoration _inputDecoration() {
    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.purple),
      ),
      filled: true,
      fillColor: Colors.white,
    );
  }
}