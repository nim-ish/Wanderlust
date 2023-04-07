import 'package:wanderlust/places_data.dart';

class TripData {
  Place selectedPlace;
  DateTime startDate;
  DateTime endDate;
  String notes;

  TripData({
    required this.selectedPlace,
    required this.startDate,
    required this.endDate,
    required this.notes,
  });
}
