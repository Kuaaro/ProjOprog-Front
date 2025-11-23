import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:proj_oprog_front/metadata_manager/view/catalog/view/vcatalog_list_view.dart';

class VCatalogWindow extends StatelessWidget {
  const VCatalogWindow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Catalog')),
      body: Column(children: [GetIt.instance<VCatalogListView>()]),
    );
  }
}
