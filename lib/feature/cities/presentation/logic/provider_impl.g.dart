// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// ignore_for_file: avoid_private_typedef_functions, non_constant_identifier_names, subtype_of_sealed_class, invalid_use_of_internal_member, unused_element, constant_identifier_names, unnecessary_raw_strings, library_private_types_in_public_api

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

String _$CityNotifierHash() => r'5b7e64068d318e5deea7a94999e8a0d74b64f3e6';

/// See also [CityNotifier].
final cityNotifierProvider =
    AutoDisposeAsyncNotifierProvider<CityNotifier, List<CityModel>>(
  CityNotifier.new,
  name: r'cityNotifierProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$CityNotifierHash,
);
typedef CityNotifierRef = AutoDisposeAsyncNotifierProviderRef<List<CityModel>>;

abstract class _$CityNotifier
    extends AutoDisposeAsyncNotifier<List<CityModel>> {
  @override
  FutureOr<List<CityModel>> build();
}

String _$cityRepositoryHash() => r'7f215fdc9425b1385dbf9a16c891285b8945ee62';

/// See also [cityRepository].
final cityRepositoryProvider = AutoDisposeProvider<CityRepository>(
  cityRepository,
  name: r'cityRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$cityRepositoryHash,
);
typedef CityRepositoryRef = AutoDisposeProviderRef<CityRepository>;
