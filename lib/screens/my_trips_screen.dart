import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wanderlust/utils/colors_util.dart';
import 'package:wanderlust/reusable_widgets/reusable_widget.dart';

class MyTripsScreen extends StatefulWidget {
  const MyTripsScreen({Key? key}) : super(key: key);

  @override
  _MyTripsScreenState createState() => _MyTripsScreenState();
}

class _MyTripsScreenState extends State<MyTripsScreen> {
  String _destination = '';
  DateTime? _startDate;
  DateTime? _endDate;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _saveTrip() async {
    final tripData = {
      'destination': _destination,
      'start_date': _startDate != null ? _startDate! : '',
      'end_date': _endDate != null ? _endDate! : '',
    };
    try {
      await FirebaseFirestore.instance.collection('trips').add(tripData);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Trip saved successfully.'),
          duration: Duration(seconds: 2),
        ),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to save trip: $error'),
          duration: Duration(seconds: 2),
        ),
      );
    }

  }

  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _destination = prefs.getString('destination') ?? '';
      final startDateStr = prefs.getString('start_date');
      if (startDateStr != null && startDateStr.isNotEmpty) {
        _startDate = DateTime.parse(startDateStr);
      }
      final endDateStr = prefs.getString('end_date');
      if (endDateStr != null && endDateStr.isNotEmpty) {
        _endDate = DateTime.parse(endDateStr);
      }
    });

    // Add the data to Firestore
    // _firestore.collection('trips').add({
    //   'destination': _destination,
    //   'start_date': _startDate == null ? null : Timestamp.fromDate(_startDate!),
    //   'end_date': _endDate == null ? null : Timestamp.fromDate(_endDate!),
    // }).then((value) => print('Trip added'))
    //     .catchError((error) => print('Failed to add trip: $error'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text('Upcoming Trip'),
          backgroundColor: Colors.deepOrangeAccent,
    ),
    body: Container(
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
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  width: 4.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              clipBehavior: Clip.hardEdge,
              child: Image.asset(
                'images/travel.jpg',
                fit: BoxFit.cover,
                height: 200.0,
                width: 200.0,
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Destination: $_destination',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Start Date: ${_startDate == null ? 'Not set' : DateFormat.yMMMd().format(_startDate!)}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'End Date: ${_endDate == null ? 'Not set' : DateFormat.yMMMd().format(_endDate!)}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _saveTrip();
              },
              child: const Text('Complete Trip',
                style: const TextStyle(
                    color: Colors.black87, fontWeight: FontWeight.normal, fontSize: 16),),
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
}