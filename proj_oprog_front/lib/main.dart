import 'package:flutter/material.dart';
import 'package:proj_oprog_front/widgets/top_navbar.dart';
import 'package:proj_oprog_front/widgets/metadata_content.dart';
import 'package:proj_oprog_front/widgets/schema_content.dart';
import 'package:proj_oprog_front/widgets/types_content.dart';
import 'package:proj_oprog_front/metadata_manager/data/presentation/catalog/catalog_list_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _selected = 'Home';
  bool _isMenuExpanded = false;

  void _toggleMenu() {
    setState(() {
      _isMenuExpanded = !_isMenuExpanded;
    });
  }

  void _selectItem(String label) {
    setState(() {
      _selected = label;
      _isMenuExpanded = false;
    });
  }

  Widget _getContent() {
    switch (_selected) {
      case 'Catalog':
        return const CatalogListView();
      case 'Metadata':
        return const MetadataContent();
      case 'Schema':
        return const SchemaContent();
      case 'Types':
        return const TypesContent();
      default:
        return const Center(
          child: Text('Home Page', style: TextStyle(fontSize: 24)),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: IconButton(
          icon: Icon(_isMenuExpanded ? Icons.close : Icons.menu),
          onPressed: _toggleMenu,
        ),
        title: _isMenuExpanded
            ? TopNavBar(selected: _selected, onSelect: _selectItem)
            : null,
      ),
      body: _getContent(),
    );
  }
}
