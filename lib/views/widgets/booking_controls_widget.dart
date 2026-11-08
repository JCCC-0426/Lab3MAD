import 'package:flutter/material.dart';

import '../../viewmodels/cruise_booking_viewmodel.dart';

/// Interactive controls: date picker, package dropdown, dark mode switch.
/// Reads and writes state through the ViewModel only.
class BookingControlsWidget extends StatelessWidget {
  final CruiseBookingViewModel viewModel;

  const BookingControlsWidget({super.key, required this.viewModel});

  Future<void> _pickDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: viewModel.visitDate,
      firstDate: DateTime(2026, 1, 1),
      lastDate: DateTime(2028, 12, 31),
    );
    if (picked != null) viewModel.setVisitDate(picked);
  }

  Widget _fieldCard({
    required BuildContext context,
    required IconData icon,
    required String label,
    required Widget child,
    VoidCallback? onTap,
  }) {
    final color = Theme.of(context).colorScheme.primary;
    return Material(
      color: color.withOpacity(0.08),
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: color.withOpacity(0.3), width: 1.2),
          ),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon,
                    color: Theme.of(context).colorScheme.onPrimary, size: 22),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      label,
                      style: TextStyle(
                        fontSize: 12,
                        letterSpacing: 0.5,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    const SizedBox(height: 2),
                    child,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      margin: const EdgeInsets.all(16),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Trip Preferences',
              style: theme.textTheme.titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 14),

            // Visit date picker
            _fieldCard(
              context: context,
              icon: Icons.calendar_month_rounded,
              label: 'VISIT DATE',
              onTap: () => _pickDate(context),
              child: Text(
                viewModel.formattedDate,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.primary,
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Cruise package dropdown
            _fieldCard(
              context: context,
              icon: Icons.directions_boat_rounded,
              label: 'CRUISE PACKAGE',
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  isExpanded: true,
                  isDense: true,
                  borderRadius: BorderRadius.circular(14),
                  icon: Icon(Icons.keyboard_arrow_down_rounded,
                      color: theme.colorScheme.primary),
                  value: viewModel.selectedPackage,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: theme.colorScheme.onSurface,
                  ),
                  items: viewModel.packages
                      .map((p) => DropdownMenuItem(
                    value: p,
                    child: Text(p, overflow: TextOverflow.ellipsis),
                  ))
                      .toList(),
                  onChanged: viewModel.setPackage,
                ),
              ),
            ),
            const SizedBox(height: 4),

            // Dark mode switch
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              secondary: const Icon(Icons.dark_mode_rounded),
              title: const Text('Dark Mode'),
              value: viewModel.isDarkMode,
              onChanged: viewModel.toggleDarkMode,
            ),
          ],
        ),
      ),
    );
  }
}