import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wanderlust/utils/colors_util.dart';
import 'package:wanderlust/reusable_widgets/reusable_widget.dart';

class TravelPlannerScreen extends StatefulWidget {
  const TravelPlannerScreen({Key? key}) : super(key: key);

  @override
  _TravelPlannerScreenState createState() => _TravelPlannerScreenState();
}

class _TravelPlannerScreenState extends State<TravelPlannerScreen> {
  late TextEditingController _destinationController;
  late TextEditingController _notesController;
  DateTime? _startDate;
  DateTime? _endDate;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _destinationController = TextEditingController();
    _notesController = TextEditingController();
    _loadData();
  }

  @override
  void dispose() {
    _destinationController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _destinationController.text = prefs.getString('destination') ?? '';
      _notesController.text = prefs.getString('notes') ?? '';
      final startDateMillis = prefs.getInt('start_date');
      if (startDateMillis != null) {
        _startDate = DateTime.fromMillisecondsSinceEpoch(startDateMillis);
      }
      final endDateMillis = prefs.getInt('end_date');
      if (endDateMillis != null) {
        _endDate = DateTime.fromMillisecondsSinceEpoch(endDateMillis);
      }
    });
  }

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
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              hexStringToColor("CB2B93"),
              hexStringToColor("9546C4"),
              hexStringToColor("5E61F4"),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _destinationController,
                decoration: const InputDecoration(
                  labelText: 'Destination',
                  labelStyle: TextStyle(color: Colors.white),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _startDate == null
                        ? 'Start Date'
                        : '${DateFormat.yMMMd().format(_startDate!)}',
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(color:Colors.white,),
                  ),
                  IconButton(
                    icon: const Icon(Icons.calendar_today, color: Colors.white,),
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
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(color:Colors.white,),
                  ),
                  IconButton(
                    icon: const Icon(Icons.calendar_today,color: Colors.white,),
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
                child: Text(
                  "Create Itinerary" ,
                  style: const TextStyle(
                      color: Colors.black87, fontWeight: FontWeight.normal, fontSize: 16),
                ),

                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.pressed)){
                        return Colors.black26;
                      }
                      return Colors.white;
                    }),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
                    )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('destination', _destinationController.text);
    await prefs.setString('start_date', _startDate?.toIso8601String() ?? '');
    await prefs.setString('end_date', _endDate?.toIso8601String() ?? '');
// Save notes to shared preferences
    await prefs.setString('notes', _notesController.text);
  }
}