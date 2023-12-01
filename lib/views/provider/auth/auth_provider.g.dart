// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$loginHash() => r'5903b415f63f0e2b8d7de4cf0d3b5e34508d1f82';

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

/// See also [login].
@ProviderFor(login)
const loginProvider = LoginFamily();

/// See also [login].
class LoginFamily extends Family<AsyncValue<BaseResponse>> {
  /// See also [login].
  const LoginFamily();

  /// See also [login].
  LoginProvider call(
    dynamic body,
  ) {
    return LoginProvider(
      body,
    );
  }

  @override
  LoginProvider getProviderOverride(
    covariant LoginProvider provider,
  ) {
    return call(
      provider.body,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'loginProvider';
}

/// See also [login].
class LoginProvider extends AutoDisposeFutureProvider<BaseResponse> {
  /// See also [login].
  LoginProvider(
    dynamic body,
  ) : this._internal(
          (ref) => login(
            ref as LoginRef,
            body,
          ),
          from: loginProvider,
          name: r'loginProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$loginHash,
          dependencies: LoginFamily._dependencies,
          allTransitiveDependencies: LoginFamily._allTransitiveDependencies,
          body: body,
        );

  LoginProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.body,
  }) : super.internal();

  final dynamic body;

  @override
  Override overrideWith(
    FutureOr<BaseResponse> Function(LoginRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LoginProvider._internal(
        (ref) => create(ref as LoginRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        body: body,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<BaseResponse> createElement() {
    return _LoginProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LoginProvider && other.body == body;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, body.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LoginRef on AutoDisposeFutureProviderRef<BaseResponse> {
  /// The parameter `body` of this provider.
  dynamic get body;
}

class _LoginProviderElement
    extends AutoDisposeFutureProviderElement<BaseResponse> with LoginRef {
  _LoginProviderElement(super.provider);

  @override
  dynamic get body => (origin as LoginProvider).body;
}

String _$registerHash() => r'74a98ea4869dbbc2965c936bdb540f6045506fea';

/// See also [register].
@ProviderFor(register)
const registerProvider = RegisterFamily();

/// See also [register].
class RegisterFamily extends Family<AsyncValue<BaseResponse>> {
  /// See also [register].
  const RegisterFamily();

  /// See also [register].
  RegisterProvider call(
    dynamic body,
  ) {
    return RegisterProvider(
      body,
    );
  }

  @override
  RegisterProvider getProviderOverride(
    covariant RegisterProvider provider,
  ) {
    return call(
      provider.body,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'registerProvider';
}

/// See also [register].
class RegisterProvider extends AutoDisposeFutureProvider<BaseResponse> {
  /// See also [register].
  RegisterProvider(
    dynamic body,
  ) : this._internal(
          (ref) => register(
            ref as RegisterRef,
            body,
          ),
          from: registerProvider,
          name: r'registerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$registerHash,
          dependencies: RegisterFamily._dependencies,
          allTransitiveDependencies: RegisterFamily._allTransitiveDependencies,
          body: body,
        );

  RegisterProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.body,
  }) : super.internal();

  final dynamic body;

  @override
  Override overrideWith(
    FutureOr<BaseResponse> Function(RegisterRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RegisterProvider._internal(
        (ref) => create(ref as RegisterRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        body: body,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<BaseResponse> createElement() {
    return _RegisterProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RegisterProvider && other.body == body;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, body.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RegisterRef on AutoDisposeFutureProviderRef<BaseResponse> {
  /// The parameter `body` of this provider.
  dynamic get body;
}

class _RegisterProviderElement
    extends AutoDisposeFutureProviderElement<BaseResponse> with RegisterRef {
  _RegisterProviderElement(super.provider);

  @override
  dynamic get body => (origin as RegisterProvider).body;
}

String _$forgotPasswordHash() => r'3d9d7e3e22afbf273e78767bcc1cb1eacc7b06eb';

/// See also [forgotPassword].
@ProviderFor(forgotPassword)
const forgotPasswordProvider = ForgotPasswordFamily();

/// See also [forgotPassword].
class ForgotPasswordFamily extends Family<AsyncValue<BaseResponse?>> {
  /// See also [forgotPassword].
  const ForgotPasswordFamily();

  /// See also [forgotPassword].
  ForgotPasswordProvider call(
    dynamic body,
  ) {
    return ForgotPasswordProvider(
      body,
    );
  }

  @override
  ForgotPasswordProvider getProviderOverride(
    covariant ForgotPasswordProvider provider,
  ) {
    return call(
      provider.body,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'forgotPasswordProvider';
}

/// See also [forgotPassword].
class ForgotPasswordProvider extends AutoDisposeFutureProvider<BaseResponse?> {
  /// See also [forgotPassword].
  ForgotPasswordProvider(
    dynamic body,
  ) : this._internal(
          (ref) => forgotPassword(
            ref as ForgotPasswordRef,
            body,
          ),
          from: forgotPasswordProvider,
          name: r'forgotPasswordProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$forgotPasswordHash,
          dependencies: ForgotPasswordFamily._dependencies,
          allTransitiveDependencies:
              ForgotPasswordFamily._allTransitiveDependencies,
          body: body,
        );

  ForgotPasswordProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.body,
  }) : super.internal();

  final dynamic body;

  @override
  Override overrideWith(
    FutureOr<BaseResponse?> Function(ForgotPasswordRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ForgotPasswordProvider._internal(
        (ref) => create(ref as ForgotPasswordRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        body: body,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<BaseResponse?> createElement() {
    return _ForgotPasswordProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ForgotPasswordProvider && other.body == body;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, body.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ForgotPasswordRef on AutoDisposeFutureProviderRef<BaseResponse?> {
  /// The parameter `body` of this provider.
  dynamic get body;
}

class _ForgotPasswordProviderElement
    extends AutoDisposeFutureProviderElement<BaseResponse?>
    with ForgotPasswordRef {
  _ForgotPasswordProviderElement(super.provider);

  @override
  dynamic get body => (origin as ForgotPasswordProvider).body;
}

String _$logoutHash() => r'4f0d55329d211061e18a3a568778e8a0aa5f4463';

/// See also [logout].
@ProviderFor(logout)
final logoutProvider = AutoDisposeFutureProvider<void>.internal(
  logout,
  name: r'logoutProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$logoutHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LogoutRef = AutoDisposeFutureProviderRef<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
