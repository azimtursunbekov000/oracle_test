import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:oracle_test/feature/cities/data/export.dart';
import 'package:oracle_test/feature/cities/domain/repositories/city_repository.dart';

final cityRepositoryProvider = Provider<CityRepository>((ref) {
  return CityRepositoryImpl();
});
