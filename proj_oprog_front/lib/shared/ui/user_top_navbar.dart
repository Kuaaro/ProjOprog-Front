import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UserTopNavbar extends StatelessWidget {
  const UserTopNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('User View'),
        const Spacer(),
        TextButton.icon(
          onPressed: () => context.go('/catalog'),
          icon: const Icon(Icons.admin_panel_settings),
          label: const Text('Manager'),
        ),
        const SizedBox(width: 8),
        FilledButton.icon(
          onPressed: () {},  
          icon: const Icon(Icons.person),
          label: const Text('User'),
        ),
      ],
    );
  }
}
