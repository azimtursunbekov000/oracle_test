import '../../data/models/city_model.dart';

abstract class CityRepository {
  /// запрос для стягивания всех городов
  Future<List<CityModel>> getAllCities();

  /// запрос для поиска
  Future<List<CityModel>> searchCities(String query);
}
