import 'package:flutter/material.dart';

class TopNavBar extends StatelessWidget {
  final String selected;
  final ValueChanged<String> onSelect;

  const TopNavBar({super.key, required this.selected, required this.onSelect});

  Widget _navButton(BuildContext context, String label) {
    final isSelected = selected == label;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ElevatedButton(
        onPressed: () => onSelect(label),
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected
              ? Theme.of(context).colorScheme.primary
              : null,
          foregroundColor: isSelected ? Colors.white : null,
        ),
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
          _navButton(context, 'Catalog'),
          _navButton(context, 'Metadata'),
          _navButton(context, 'Schema'),
          _navButton(context, 'Types'),
        ],
      ),
    );
  }
}
