import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart'; // Добавьте этот импорт
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:oracle_test/feature/cities/presentation/screens/cities_screen.dart';

import 'internal/utils/localization/generated/l10n.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: const CitiesScreen(),
    );
  }
}
