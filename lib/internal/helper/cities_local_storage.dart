import 'dart:convert';

import 'package:oracle_test/feature/cities/data/models/city_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CitiesLocalStorage {
  static const String _citiesKey = 'cities_key';

  static Future<void> saveCities(List<CityModel> cities) async {
    final prefs = await SharedPreferences.getInstance();
    final String citiesJson =
        jsonEncode(cities.map((city) => city.toJson()).toList());
    await prefs.setString(_citiesKey, citiesJson);
  }

  static Future<List<CityModel>> loadCities() async {
    final prefs = await SharedPreferences.getInstance();
    final String? citiesJson = prefs.getString(_citiesKey);
    if (citiesJson != null) {
      final List<dynamic> citiesList = jsonDecode(citiesJson);
      return citiesList.map((city) => CityModel.fromJson(city)).toList();
    }
    return [];
  }
}
