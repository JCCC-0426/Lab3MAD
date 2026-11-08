import 'package:flutter/material.dart';

import '../viewmodels/cruise_booking_viewmodel.dart';
import 'widgets/action_bar_widget.dart';
import 'widgets/booking_controls_widget.dart';
import 'widgets/description_widget.dart';
import 'widgets/header_image_widget.dart';
import 'widgets/title_section_widget.dart';

/// VIEW layer: assembles the sub-widgets and adapts to orientation.
class CruiseBookingScreen extends StatelessWidget {
  final CruiseBookingViewModel viewModel;

  const CruiseBookingScreen({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    // Rebuild whenever the ViewModel calls notifyListeners().
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Sibu River Cruise & Heritage'),
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
          ),
          body: OrientationBuilder(
            builder: (context, orientation) {
              return orientation == Orientation.portrait
                  ? _buildPortrait()
                  : _buildLandscape();
            },
          ),
        );
      },
    );
  }

  Widget _header({double height = 220}) => HeaderImageWidget(
    imageUrl: viewModel.destination.imageUrl,
    caption: viewModel.destination.landmarkCaption,
    height: height,
  );

  List<Widget> _details() => [
    TitleSectionWidget(
      name: viewModel.destination.name,
      location: viewModel.destination.location,
      rating: viewModel.rating,
      onStarTap: viewModel.incrementRating,
    ),
    const Divider(height: 1),
    const ActionBarWidget(),
    const Divider(height: 1),
    DescriptionWidget(text: viewModel.destination.description),
    BookingControlsWidget(viewModel: viewModel),
  ];

  /// Portrait: single scrolling column (Figure 1).
  Widget _buildPortrait() {
    return ListView(
      children: [_header(), ..._details()],
    );
  }

  /// Landscape: image on the left, scrolling details on the right (Figure 2).
  Widget _buildLandscape() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) =>
                _header(height: constraints.maxHeight),
          ),
        ),
        Expanded(
          child: ListView(children: _details()),
        ),
      ],
    );
  }
}