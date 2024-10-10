import 'package:oracle_test/feature/cities/data/models/city_model.dart';
import 'package:oracle_test/feature/cities/data/repositories/city_repository_impl.dart';
import 'package:oracle_test/feature/cities/domain/repositories/city_repository.dart';
import 'package:oracle_test/internal/helper/cities_local_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider_impl.g.dart';

@riverpod
CityRepository cityRepository(CityRepositoryRef ref) {
  return CityRepositoryImpl();
}

@riverpod
class CityNotifier extends _$CityNotifier {
  late final CityRepository _cityRepository;

  @override
  Future<List<CityModel>> build() async {
    _cityRepository = ref.read(cityRepositoryProvider);
    return fetchCities();
  }

  Future<List<CityModel>> fetchCities() async {
    try {
      final cities = await _cityRepository.getAllCities();
      return cities;
    } catch (e, stackTrace) {
      throw AsyncError(e, stackTrace);
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
