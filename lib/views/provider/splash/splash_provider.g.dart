// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$newUserHash() => r'83da89bfc98fcfca7fc7eee6c1336a4df115046d';

/// See also [NewUser].
@ProviderFor(NewUser)
final newUserProvider = AutoDisposeNotifierProvider<NewUser, bool>.internal(
  NewUser.new,
  name: r'newUserProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$newUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NewUser = AutoDisposeNotifier<bool>;
String _$checkUserHash() => r'c735d4b6f1e9a706f1acc153a0470315c7ae1893';

/// See also [CheckUser].
@ProviderFor(CheckUser)
final checkUserProvider = NotifierProvider<CheckUser, bool>.internal(
  CheckUser.new,
  name: r'checkUserProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$checkUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CheckUser = Notifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
