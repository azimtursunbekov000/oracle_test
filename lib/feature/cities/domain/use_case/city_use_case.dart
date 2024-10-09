import 'package:oracle_test/feature/cities/data/models/city_model.dart';

import '../repositories/city_repository.dart';

class AuthUseCase {
  final CityRepository cityRepository;

  AuthUseCase({required this.cityRepository});

  Future<List<CityModel>> login() async {
    return await cityRepository.getAllCities();
  }
}
