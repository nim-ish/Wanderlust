import 'package:flutter/material.dart';
import 'package:wanderlust/utils/colors_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User? currentUser = FirebaseAuth.instance.currentUser;
    final String email = currentUser?.email ?? 'unknown';
    final User? user = FirebaseAuth.instance.currentUser;
    if (user == null){
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'You need to be logged in to see your upcoming trip.',
                  style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepOrangeAccent,
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
                Center(
                  child: Column(
                    children: [
                      const CircleAvatar(
                        radius: 75.0,
                        backgroundImage: AssetImage('images/Circle Avatar.jpg'),
                      ),
                      const SizedBox(height: 16.0),
                      const SizedBox(height: 16.0),
                      Text(
                        '$email', // fetch name from firebase
                        style: const TextStyle(
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      const Text(
                        'Travel History',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                  const SizedBox(height: 16.0),
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),
                Expanded(
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance.collection('trips').snapshots(),
                    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      final List<DocumentSnapshot> documents = snapshot.data!.docs;
                      return ListView.builder(
                        itemCount: documents.length,
                        itemBuilder: (BuildContext context, int index) {
                          //final Map<String, dynamic> data = documents[index].data()!;
                          //final Map<String, Object?> data = documents[index].data()!;
                          final Map<String, dynamic> data = documents[index].data() as Map<String, dynamic>;
                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 8.0),
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  blurRadius: 6.0,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Destination: ${data['destination']}',
                                  style: const TextStyle(
                                    color: Colors.black87,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 8.0),
                                Text(
                                  'Start Date: ${data['start_date'] != null ? DateFormat.yMMMd().format((data['start_date'] as Timestamp).toDate()) : 'Not set'}',
                                  style: const TextStyle(
                                    color: Colors.black54,
                                    fontSize: 16.0,
                                  ),
                                ),
                                const SizedBox(height: 8.0),
                                Text(
                                  'End Date: ${data['end_date'] != null ? DateFormat.yMMMd().format((data['end_date'] as Timestamp).toDate()) : 'Not set'}',
                                  style: const TextStyle(
                                    color: Colors.black54,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ],
                            ),
                          );

                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }
}
