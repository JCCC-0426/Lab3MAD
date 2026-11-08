/// MODEL layer: a pure data class with no Flutter or UI dependencies.
class CruiseDestination {
  final String name;
  final String location;
  final String landmarkCaption;
  final String description;
  final String imageUrl;
  final int initialRating;

  const CruiseDestination({
    required this.name,
    required this.location,
    required this.landmarkCaption,
    required this.description,
    required this.imageUrl,
    required this.initialRating,
  });

  /// Sample data for the Rajang River Cruise.
  static const CruiseDestination rajangExpress = CruiseDestination(
    name: 'Rajang River Express Cruise',
    location: 'Sibu Waterfront, Sarawak',
    landmarkCaption: 'Sibu Esplanade Landmark',
    description:
    'Experience the heart of Sibu along Malaysia\'s longest river, the '
        'Rajang. Cruise past historic temples, timber hubs, and waterfront '
        'settlements while experiencing authentic Sarawakian hospitality.',

    imageUrl: 'assets/SibuEsplanadeLandmark.jpeg',
    initialRating: 43,
  );

  /// Cruise packages offered in the dropdown.
  static const List<String> packages = [
    'Private River Cruise',
    'Sunset Cruise',
    'Sunrise Cruise',
    'Rural Cruise',
    'SMI Park Cruise',
  ];
}