import 'package:flutter/material.dart';

import '../../../../internal/constants/export.dart';

class SearchWidget extends StatelessWidget {
  final Function(String) onChanged;

  const SearchWidget({
    super.key,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Поиск городов...',
        hintStyle: AppTexts.poppins16w400,
        filled: true,
        fillColor: Colors.white.withOpacity(0.8),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        suffixIcon: const Icon(
          Icons.search,
          color: Colors.blueAccent,
        ),
      ),
      onChanged: onChanged,
    );
  }
}
