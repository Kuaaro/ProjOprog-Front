import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:proj_oprog_front/global_dispatcher.dart';
import 'package:proj_oprog_front/iglobal_dispather.dart';

class TopNavBar extends StatelessWidget {
  Widget _navButton(
    BuildContext context,
    String label,
    VoidCallback onPressed,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ElevatedButton(
        onPressed: () => onPressed(),
        style: ElevatedButton.styleFrom(),
        child: Text(label),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _navButton(
            context,
            'Catalog',
            () => GetIt.instance<IGlobalDispather>().showCatalogWindow(),
          ),
          _navButton(
            context,
            'Metadata',
            () => GetIt.instance<IGlobalDispather>().showMetadataWindow(),
          ),
        ],
      ),
    );
  }
}
