import 'package:flutter/material.dart';

class Place {
  final String imageUrl;
  final String name;
  final String location;

  const Place({
    required this.imageUrl,
    required this.name,
    required this.location,
  });
}

const List<Place> places = [
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
