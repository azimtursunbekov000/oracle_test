import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:oracle_test/feature/cities/data/models/city_model.dart';
import 'package:oracle_test/feature/cities/data/repositories/city_repository_impl.dart';

import '../../../../internal/helper/city_notofier.dart';
import '../../domain/repositories/city_repository.dart';

final cityRepositoryProvider = Provider<CityRepository>((ref) {
  return CityRepositoryImpl();
});

final citiesProvider =
    StateNotifierProvider<CityNotifier, AsyncValue<List<CityModel>>>((ref) {
  final cityRepository = ref.read(cityRepositoryProvider);
  return CityNotifier(cityRepository)..fetchCities();
});
