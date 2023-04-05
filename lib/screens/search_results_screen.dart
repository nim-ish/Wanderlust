import 'package:flutter/material.dart';

class SearchResultsScreen extends StatelessWidget {
  const SearchResultsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Results'),
      ),
      body: ListView.builder(
        itemCount: 10, // Replace with actual count of search results
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Image.network(
                'https://via.placeholder.com/150x150.png?text=Destination+Image'),
            title: Text('Destination Name $index'),
            subtitle: Text('Location $index'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              // Navigate to destination details screen
              // Navigator.push(
              // context,
              // MaterialPageRoute(builder: (context) => DestinationDetailsScreen()),
              // );
            },
          );
        },
      ),
    );
  }
}
