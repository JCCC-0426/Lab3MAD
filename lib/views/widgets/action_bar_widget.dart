import 'package:flutter/material.dart';

/// CALL / ROUTE / SHARE buttons, evenly spaced.
class ActionBarWidget extends StatelessWidget {
  const ActionBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _action(context, Icons.call, 'CALL'),
          _action(context, Icons.near_me, 'ROUTE'),
          _action(context, Icons.share, 'SHARE'),
        ],
      ),
    );
  }

  Widget _action(BuildContext context, IconData icon, String label) {
    final color = Theme.of(context).colorScheme.primary;
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () => ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text('$label tapped'))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color.withOpacity(0.12),
                border: Border.all(color: color.withOpacity(0.35), width: 1.5),
                boxShadow: [
                  BoxShadow(
                    color: color.withOpacity(0.18),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Icon(icon, color: color, size: 25),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 13,
                fontWeight: FontWeight.w700,
                letterSpacing: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}