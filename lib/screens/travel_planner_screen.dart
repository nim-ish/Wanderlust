import 'package:flutter/material.dart';
import 'package:wanderlust/places_data.dart';

class TravelPlannerScreen extends StatefulWidget {
  const TravelPlannerScreen({Key? key}) : super(key: key);

  @override
  _TravelPlannerScreenState createState() => _TravelPlannerScreenState();
}

class _TravelPlannerScreenState extends State<TravelPlannerScreen> {
  Place? _selectedPlace;
  DateTime? _startDate;
  DateTime? _endDate;
  String _notes = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Planner'),
        ),
        body: Padding(
        padding: const EdgeInsets.all(16.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(
    'Where do you want to go?',
    style: Theme.of(context).textTheme.headline6,
    ),
    SizedBox(height: 16.0),
    DropdownButtonFormField<Place>(
    decoration: InputDecoration(
    labelText: 'Destination',
    ),
    value: _selectedPlace,
    items: places
        .map(
    (place) => DropdownMenuItem(
    value: place,
    child: Text(place.name),
    ),
    )
        .toList(),
    onChanged: (newValue) {
    setState(() {
    _selectedPlace = newValue;
    });
    },
    ),
    SizedBox(height: 16.0),
    Text(
    _selectedPlace?.name ?? 'No destination selected',
    style: Theme.of(context).textTheme.headline6,
    ),
    SizedBox(height: 16.0),
    Text(
    'When do you want to go?',
    style: Theme.of(context).textTheme.headline6,
    ),
    SizedBox(height: 16.0),
    Row(
    children: [
    Expanded(
    child: GestureDetector(
    onTap: () {
    _selectDate(context, true); // true for start date
    },
    child: Container(
    decoration: BoxDecoration(
    border: Border.all(
    color: Colors.grey,
    ),
    borderRadius: BorderRadius.circular(4.0),
    ),
    padding: EdgeInsets.symmetric(
    horizontal: 16.0, vertical: 8.0),
    child: Row(
    mainAxisAlignment:
    MainAxisAlignment.spaceBetween,
    children: [
    Text(
    _startDate == null
    ? 'Start Date'
        : '${_startDate!.day}/${_startDate!.month}/${_startDate!.year}',
    style: Theme.of(context).textTheme.bodyText2,
    ),
    Icon(Icons.calendar_today),
    ],
    ),
    ),
    ),
    ),
    SizedBox(width: 16.0),
    Expanded(
    child: GestureDetector(
    onTap: () {
    _selectDate(context, false); // false for end date
    },
    child: Container(
    decoration: BoxDecoration(
    border: Border.all(
    color: Colors.grey,
    ),
    borderRadius: BorderRadius.circular(4.0),
    ),
    padding: EdgeInsets.symmetric(
    horizontal: 16.0, vertical: 8.0),
    child: Row(
    mainAxisAlignment:
    MainAxisAlignment.spaceBetween,
    children: [
    Text(
    _endDate == null
    ? 'End Date'
        : '${_endDate!.day}/${_endDate!.month}/${_endDate!.year}',
    style: Theme.of(context).textTheme.bodyText2,
    ),
    Icon(Icons.calendar_today),
    ],
    ),
    ),
    ),
    ),
    ],
    ),
    SizedBox(height: 16.0),
    TextField(
    decoration: InputDecoration(
    labelText: 'Notes',
    border: OutlineInputBorder(),
    ),
    ),
    ],
    ),
        ),
    );
  }

  _selectDate(BuildContext context, bool isStartDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isStartDate ? _startDate ?? DateTime.now() : _endDate ??
          DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        if (isStartDate) {
          _startDate = picked;
        } else {
          _endDate = picked;
        }
      });
    }
  }
}