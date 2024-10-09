import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:oracle_test/feature/cities/data/models/city_model.dart';
import 'package:oracle_test/feature/cities/domain/repositories/city_repository.dart';
import 'package:oracle_test/internal/helper/api_requester.dart';
import 'package:oracle_test/internal/helper/catch_exception.dart';
import 'package:oracle_test/internal/helper/cities_local_storage.dart'; // Импортируйте ваш класс локального хранилища

class CityRepositoryImpl implements CityRepository {
  final ApiRequester apiRequester = ApiRequester();

  @override
  Future<List<CityModel>> getAllCities() async {
    try {
      // Выполняем запрос к API для получения списка городов
      Response response = await apiRequester.toGet('locations/cities/');
      log('All cities received: ${response.data}');

      await Future.delayed(
          const Duration(seconds: 2)); // Удалите, если это не нужно

      // Преобразуем данные в модель и сохраняем в локальное хранилище
      final List<CityModel> cities = (response.data as List)
          .map((cityJson) => CityModel.fromJson(cityJson))
          .toList();

      // Сохраняем список городов в локальном хранилище
      await CitiesLocalStorage.saveCities(cities);

      return cities;
    } catch (e) {
      log('Error fetching cities: $e');
      // В случае ошибки загружаем данные из локального хранилища
      try {
        return await CitiesLocalStorage.loadCities();
      } catch (e) {
        log('Error loading cities from local storage: $e');
        throw CatchException.convertException(e).message.toString();
      }
    }
  }
}
