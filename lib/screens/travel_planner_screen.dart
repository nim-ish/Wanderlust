import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TravelPlannerScreen extends StatefulWidget {
  const TravelPlannerScreen({Key? key}) : super(key: key);

  @override
  _TravelPlannerScreenState createState() => _TravelPlannerScreenState();
}

class _TravelPlannerScreenState extends State<TravelPlannerScreen> {
  late TextEditingController _destinationController;
  DateTime? _startDate;
  DateTime? _endDate;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _destinationController = TextEditingController();
    _loadData();
  }

  @override
  void dispose() {
    _destinationController.dispose();
    super.dispose();
  }

  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _destinationController.text = prefs.getString('destination') ?? '';
      final startDateMillis = prefs.getInt('start_date');
      if (startDateMillis != null) {
        _startDate = DateTime.fromMillisecondsSinceEpoch(startDateMillis);
      }
      final endDateMillis = prefs.getInt('end_date');
      if (endDateMillis != null) {
        _endDate = DateTime.fromMillisecondsSinceEpoch(endDateMillis);
      }
    }
    );
  }

  // Future<void> _saveData() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.setString('destination', _destinationController.text);
  //   await prefs.setInt('start_date', _startDate?.millisecondsSinceEpoch ?? 0);
  //   await prefs.setInt('end_date', _endDate?.millisecondsSinceEpoch ?? 0);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Travel Planner'),
          actions: [
            IconButton(
              icon: const Icon(Icons.save),
              onPressed: () async {
                setState(() {
                  _isSaving = true;
                });
                await _saveData();
                setState(() {
                  _isSaving = false;
                });
              },
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
            TextField(
            controller: _destinationController,
            decoration: const InputDecoration(
              labelText: 'Destination',
            ),
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _startDate == null
                    ? 'Start Date'
                    : '${DateFormat.yMMMd().format(_startDate!)}',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              IconButton(
                icon: const Icon(Icons.calendar_today),
                onPressed: () async {
                  final selectedDate = await showDatePicker(
                    context: context,
                    initialDate: _startDate ?? DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 365)),
                  );
                  if (selectedDate != null) {
                    setState(() {
                      _startDate = selectedDate;
                    });
                  }
                },
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
          Text(
          _endDate == null
          ? 'End Date'
              : '${DateFormat.yMMMd().format(_endDate!)}',
          style: Theme.of(context).textTheme.bodyText2,
        ),
        IconButton(
        icon: const Icon(Icons.calendar_today),
    onPressed: () async {
    final selectedDate = await showDatePicker(
    context: context,
    initialDate: _endDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (selectedDate != null) {
      setState(() {
        _endDate = selectedDate;
      });
      await _saveData();
    }
    },
        ),
              ],
          ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  await _saveData();
                  Navigator.of(context).pushNamed('/itinerary');
                },
                child: const Text('Create Itinerary'),
              ),
            ],
          ),
        ),
    );
  }

  Future<void> _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('destination', _destinationController.text);
    await prefs.setString('start_date', _startDate?.toIso8601String() ?? '');
    await prefs.setString('end_date', _endDate?.toIso8601String() ?? '');
  }
}
