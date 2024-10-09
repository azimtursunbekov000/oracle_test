import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oracle_test/feature/cities/data/models/city_model.dart';

import '../../feature/cities/domain/repositories/city_repository.dart';
import 'cities_local_storage.dart';

class CityNotifier extends StateNotifier<AsyncValue<List<CityModel>>> {
  final CityRepository _cityRepository;

  CityNotifier(this._cityRepository) : super(const AsyncValue.loading());

  Future<void> fetchCities() async {
    try {
      final cities = await _cityRepository.getAllCities();
      state = AsyncValue.data(cities);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }

  Future<void> loadCitiesFromLocalStorage() async {
    try {
      final cities = await CitiesLocalStorage.loadCities();
      state = AsyncValue.data(cities);
    } catch (e, stackTrace) {
      // Capture stack trace here
      state = AsyncValue.error(e, stackTrace); // Pass the error and stack trace
    }
  }
}
