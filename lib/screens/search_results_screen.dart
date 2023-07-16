import 'package:flutter/material.dart';
import 'package:country_data/country_data.dart';
import 'package:wanderlust/utils/colors_util.dart';

class SearchResultsScreen extends StatefulWidget {
  const SearchResultsScreen({Key? key}) : super(key: key);

  @override
  _SearchResultsScreenState createState() => _SearchResultsScreenState();
}

class _SearchResultsScreenState extends State<SearchResultsScreen> {

  CountryData countryData = CountryData();
  List<Country> countries = [];
  List<String> states = [];
  List<String> cities = [];

  @override
  initState() {
    super.initState();
    initCountries();
  }

  Country? selectedCountry;
  late String selectedState;
  late String selectedCity;

  void initCountries() {
    countries = countryData.getCountries();
    selectedCountry = countries[0];
    initCountryStates();
  }

  // select country
  void selectCountry({required String countryId}) {
    selectedCountry = countryData.getCountryById(countryId: countryId);
    if (selectedCountry != null) {
      initCountryStates();
      setState(() {});
    }
  }

  void initCountryStates() {
    // select state
    states = countryData.getStates(countryId: selectedCountry!.id);
    if (states.isEmpty) states = [selectedCountry!.name];
    selectedState = states[0];
    setState(() {});
    initCities();
  }

  void selectState({required String state}) {
    selectedState = state;
    initCities();
    setState(() {});
  }

  void initCities() {
    cities = countryData.getCities(
        countryId: selectedCountry!.id, state: selectedState);
    if (cities.isEmpty) cities = [selectedState];
    selectedCity = cities[0];
    setState(() {});
  }

  void selectCity({required String city}) {
    selectedCity = city;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Places'),
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
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Search Country",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: countries.length,
                  itemBuilder: (BuildContext context, int index) {
                    final country = countries[index];
                    return ListTile(
                      leading: Text(
                        country.emoji,
                        style: TextStyle(fontSize: 24),
                      ),
                      title: Text(
                        country.name,
                        style: TextStyle(fontSize: 18, color: Colors.white,),
                      ),
                      onTap: () {
                        selectCountry(countryId: country.id);
                      },
                    );
                  },
                ),

              ),
              Row(
                children: [
                  const Expanded(
                    flex: 2,
                    child: Text(
                      "Search State ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: DropdownButton<String>(
                        value: selectedState,
                        items: states
                            .map((state) => DropdownMenuItem<String>(
                          value: state,
                          child: Text(state,),
                        ))
                            .toList(),
                        onChanged: (state) {
                          if (state != null) selectState(state: state);
                        }),
                  )
                ],
              ),
              Row(
                children: [
                  const Expanded(flex: 2,
                    child: Text(
                      "Search City ",
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: DropdownButton<String>(
                        value: selectedCity,
                        items: cities
                            .map((city) => DropdownMenuItem<String>(
                          value: city,
                          child: Text(city),
                        ))
                            .toList(),
                        onChanged: (city) {
                          if (city != null) selectCity(city: city);
                        }),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CountryListScreen extends StatelessWidget {
  final List<Country> countries;
  final Function(Country) onCountrySelected;

  const CountryListScreen({
    Key? key,
    required this.countries,
    required this.onCountrySelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select a Country'),
      ),
      body: ListView.builder(
        itemCount: countries.length,
        itemBuilder: (context, index) {
          final country = countries[index];
          return ListTile(
            leading: Text(country.emoji),
            title: Text(country.name),
            onTap: () {
              onCountrySelected(country);
              Navigator.pop(context);
            },
          );
        },
      ),
    );
  }
}