import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:proj_oprog_front/metadata_manager/view/catalog/view/vcatalog_list_view.dart';
import 'package:proj_oprog_front/metadata_manager/view/catalog/view_model/catalog_list_view_model.dart';

// Główne okno
class VCatalogWindow extends StatelessWidget {
  const VCatalogWindow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Catalog')),
      body: Column(
        children: [
          GetIt.instance<VCatalogListView>(),
          Center(child: Text('here')),
        ],
      ),
    );
  }
}
