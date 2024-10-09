import 'package:hooks_riverpod/hooks_riverpod.dart';
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
      state = AsyncValue.error(e, stackTrace);
    }
  }

  Future<void> searchCities(String query) async {
    state = const AsyncValue.loading();
    try {
      final cities = await _cityRepository.searchCities(query);
      state = AsyncValue.data(cities);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}
