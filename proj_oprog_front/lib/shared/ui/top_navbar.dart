import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:proj_oprog_front/catalog/use_case/ishow_catalog.dart';

class TopNavBar extends StatelessWidget {
  final IShowCatalog catalogUseCase;

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
            () => catalogUseCase.showCatalog(null),
          ),
          _navButton(context, 'Metadata', () => context.go('/metadata')),
          _navButton(context, 'Schema', () => context.go('/schema')),
          _navButton(context, 'Mock Sensor', () => context.go('/sensor/mock')),
        ],
      ),
    );
  }
}
