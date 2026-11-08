import 'package:flutter/material.dart';

import 'viewmodels/cruise_booking_viewmodel.dart';
import 'views/cruise_booking_screen.dart';

void main() {
  runApp(const RajangCruiseApp());
}

class RajangCruiseApp extends StatefulWidget {
  const RajangCruiseApp({super.key});

  @override
  State<RajangCruiseApp> createState() => _RajangCruiseAppState();
}

class _RajangCruiseAppState extends State<RajangCruiseApp> {
  // One ViewModel instance for the lifetime of the app.
  final CruiseBookingViewModel _viewModel = CruiseBookingViewModel();

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Rebuild MaterialApp when the theme toggle changes.
    return ListenableBuilder(
      listenable: _viewModel,
      builder: (context, _) {
        return MaterialApp(
          title: 'Rajang River Cruise',
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(useMaterial3: true).copyWith(
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xFF4F46E5),
              brightness: Brightness.light,
            ),
          ),
          darkTheme: ThemeData.dark(useMaterial3: true).copyWith(
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xFF4F46E5),
              brightness: Brightness.dark,
            ),
          ),
          themeMode: _viewModel.themeMode,
          home: CruiseBookingScreen(viewModel: _viewModel),
        );
      },
    );
  }
}