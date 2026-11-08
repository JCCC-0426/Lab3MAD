import 'package:flutter/material.dart';

/// Padded container with the destination description.
class DescriptionWidget extends StatelessWidget {
  final String text;

  const DescriptionWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Text(
        text,
        softWrap: true,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.5),
      ),
    );
  }
}