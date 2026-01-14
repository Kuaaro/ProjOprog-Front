import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:proj_oprog_front/catalog/use_case/ishow_catalog.dart';
import 'package:proj_oprog_front/schema/use_case/ishow_schema_list_uc.dart';
import 'package:proj_oprog_front/feedback/view/feedback_list_dialog.dart';

class TopNavBar extends StatelessWidget {
  const TopNavBar({super.key});

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
    return Row(
      children: [
         
        _navButton(
          context,
          'Catalog',
          () => GetIt.instance<IShowCatalog>().showCatalog(null),
        ),
        _navButton(context, 'Metadata', () => context.go('/metadata')),
        _navButton(context, 'Schema', () => context.go('/schema')),
		_navButton(context, 'Mock Sensor', () => context.go('/sensor/mock')),
      

        const Spacer(),

         
        FilledButton.icon(
          onPressed: () {},  
          icon: const Icon(Icons.admin_panel_settings),
          label: const Text('Manager'),
        ),
        const SizedBox(width: 8),
        TextButton.icon(
          onPressed: () => context.go('/user/catalog'),
          icon: const Icon(Icons.person),
          label: const Text('User'),
        ),
      ],
    );
  }
}
