import 'package:flutter/material.dart';

class Place {
  String imageUrl;
  String name;
  String location;

  Place({required this.imageUrl, required this.name, required this.location});
}

class SearchResultsScreen extends StatefulWidget {
  const SearchResultsScreen({Key? key}) : super(key: key);

  @override
  _SearchResultsScreenState createState() => _SearchResultsScreenState();
}

class _SearchResultsScreenState extends State<SearchResultsScreen> {
  List<Place> _places = [
    Place(
      imageUrl: 'https://via.placeholder.com/150x150.png?text=Destination+Image',
      name: 'Paris',
      location: 'France',
    ),
    Place(
      imageUrl: 'https://via.placeholder.com/150x150.png?text=Destination+Image',
      name: 'New York City',
      location: 'USA',
    ),
    Place(
      imageUrl: 'https://via.placeholder.com/150x150.png?text=Destination+Image',
      name: 'Tokyo',
      location: 'Japan',
    ),
    Place(
      imageUrl: 'https://via.placeholder.com/150x150.png?text=Destination+Image',
      name: 'Sydney',
      location: 'Australia',
    ),
    Place(
      imageUrl: 'https://via.placeholder.com/150x150.png?text=Destination+Image',
      name: 'Rome',
      location: 'Italy',
    ),
    Place(
      imageUrl: 'https://via.placeholder.com/150x150.png?text=Destination+Image',
      name: 'Rio de Janeiro',
      location: 'Brazil',
    ),
    Place(
      imageUrl: 'https://via.placeholder.com/150x150.png?text=Destination+Image',
      name: 'Barcelona',
      location: 'Spain',
    ),
    Place(
      imageUrl: 'https://via.placeholder.com/150x150.png?text=Destination+Image',
      name: 'Dubai',
      location: 'UAE',
    ),
    Place(
      imageUrl: 'https://via.placeholder.com/150x150.png?text=Destination+Image',
      name: 'Bangkok',
      location: 'Thailand',
    ),
    Place(
      imageUrl: 'https://via.placeholder.com/150x150.png?text=Destination+Image',
      name: 'Cape Town',
      location: 'South Africa',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Results'),
      ),
      body: ListView.builder(
        itemCount: _places.length,
        itemBuilder: (BuildContext context, int index) {
          Place place = _places[index];
          return ListTile(
            leading: Image.network(place.imageUrl),
            title: Text(place.name),
            subtitle: Text(place.location),
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
