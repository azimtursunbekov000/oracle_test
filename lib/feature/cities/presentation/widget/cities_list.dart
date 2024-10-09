import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:oracle_test/feature/cities/data/export.dart';
import 'package:oracle_test/feature/cities/presentation/export.dart';

class CitiesList extends StatelessWidget {
  final AsyncValue<List<CityModel>> citiesAsyncValue;

  const CitiesList({super.key, required this.citiesAsyncValue});

  @override
  Widget build(BuildContext context) {
    return citiesAsyncValue.when(
      data: (cities) {
        if (cities.isEmpty) {
          return const Center(child: Text('Нет доступных городов.'));
        }
        return ListView.builder(
          itemCount: cities.length,
          itemBuilder: (context, index) {
            final city = cities[index];
            return CityCard(city: city);
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Center(
        child: Text('Ошибка: $error'),
      ),
    );
  }
}
