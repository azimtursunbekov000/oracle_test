import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:oracle_test/feature/cities/presentation/export.dart';
import 'package:oracle_test/feature/cities/presentation/logic/provider_repository.dart';
import 'package:oracle_test/feature/cities/presentation/widget/search_widget.dart';

import '../../../../internal/constants/export.dart';

class CitiesScreen extends HookConsumerWidget {
  const CitiesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final citiesAsyncValue = ref.watch(citiesProvider);
    final searchQuery = useState('');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        centerTitle: true,
        title: const Text(
          'Города',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background_image.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchWidget(
              onChanged: (value) {
                searchQuery.value = value;
                if (value.isNotEmpty) {
                  ref.read(citiesProvider.notifier).searchCities(value);
                } else {
                  ref
                      .read(citiesProvider.notifier)
                      .loadCitiesFromLocalStorage();
                }
              },
            ),
            const SizedBox(height: 16),
            Expanded(
              child: CitiesList(citiesAsyncValue: citiesAsyncValue),
            ),
          ],
        ),
      ),
    );
  }
}
