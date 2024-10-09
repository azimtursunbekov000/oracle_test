import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oracle_test/feature/cities/data/repositories/city_repository_impl.dart';
import 'package:oracle_test/feature/cities/domain/repositories/city_repository.dart';

final cityRepositoryProvider = Provider<CityRepository>((ref) {
  return CityRepositoryImpl();
});
