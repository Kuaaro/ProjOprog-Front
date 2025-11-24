import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:proj_oprog_front/metadata_manager/uc/icatalog_uc.dart';

class TopNavBar extends StatelessWidget {
  final ICatalogUseCase catalogUseCase;

  TopNavBar(this.catalogUseCase);

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
            () => catalogUseCase.showCatalogUC(null),
          ),
          _navButton(context, 'Metadata', () => context.go('/metadata')),
        ],
      ),
    );
  }
}
