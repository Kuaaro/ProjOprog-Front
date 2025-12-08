import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:proj_oprog_front/catalog/use_case/icatalog_uc.dart';
import 'package:proj_oprog_front/schema/use_case/ishow_schema_list_uc.dart';

class TopNavBar extends StatelessWidget {
  final ICatalogUseCase catalogUseCase;

  const TopNavBar(this.catalogUseCase, {super.key});

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
          _navButton(context, 'Schema', () => context.go('/schema')),
        ],
      ),
    );
  }
}
