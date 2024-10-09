import 'package:flutter/material.dart';
import 'package:oracle_test/feature/cities/data/export.dart';

class CityCard extends StatelessWidget {
  final CityModel city;

  const CityCard({
    super.key,
    required this.city,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      color: Colors.white.withOpacity(0.9),
      child: ListTile(
        title: Text(
          city.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        subtitle: Text(
          city.slug,
          style: const TextStyle(color: Colors.grey),
        ),
        onTap: () {},
      ),
    );
  }
}
