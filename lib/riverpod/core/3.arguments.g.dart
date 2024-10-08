// GENERATED CODE - DO NOT MODIFY BY HAND

part of '3.arguments.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$hitokotoHash() => r'3313539f7fbc0dbd9d2dc8d80d20f80d61957216';

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

/// See also [hitokoto].
@ProviderFor(hitokoto)
const hitokotoProvider = HitokotoFamily();

/// See also [hitokoto].
class HitokotoFamily extends Family<AsyncValue<Hitokoto>> {
  /// See also [hitokoto].
  const HitokotoFamily();

  /// See also [hitokoto].
  HitokotoProvider call(
    String type,
  ) {
    return HitokotoProvider(
      type,
    );
  }

  @override
  HitokotoProvider getProviderOverride(
    covariant HitokotoProvider provider,
  ) {
    return call(
      provider.type,
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
  String? get name => r'hitokotoProvider';
}

/// See also [hitokoto].
class HitokotoProvider extends AutoDisposeFutureProvider<Hitokoto> {
  /// See also [hitokoto].
  HitokotoProvider(
    String type,
  ) : this._internal(
          (ref) => hitokoto(
            ref as HitokotoRef,
            type,
          ),
          from: hitokotoProvider,
          name: r'hitokotoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$hitokotoHash,
          dependencies: HitokotoFamily._dependencies,
          allTransitiveDependencies: HitokotoFamily._allTransitiveDependencies,
          type: type,
        );

  HitokotoProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.type,
  }) : super.internal();

  final String type;

  @override
  Override overrideWith(
    FutureOr<Hitokoto> Function(HitokotoRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: HitokotoProvider._internal(
        (ref) => create(ref as HitokotoRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        type: type,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Hitokoto> createElement() {
    return _HitokotoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is HitokotoProvider && other.type == type;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, type.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin HitokotoRef on AutoDisposeFutureProviderRef<Hitokoto> {
  /// The parameter `type` of this provider.
  String get type;
}

class _HitokotoProviderElement
    extends AutoDisposeFutureProviderElement<Hitokoto> with HitokotoRef {
  _HitokotoProviderElement(super.provider);

  @override
  String get type => (origin as HitokotoProvider).type;
}

String _$hitokotoNotifierHash() => r'e0fa4b2e596d14d5770419e81cdf88471465e788';

/// See also [HitokotoNotifier].
@ProviderFor(HitokotoNotifier)
final hitokotoNotifierProvider =
    AutoDisposeAsyncNotifierProvider<HitokotoNotifier, Hitokoto>.internal(
  HitokotoNotifier.new,
  name: r'hitokotoNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$hitokotoNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$HitokotoNotifier = AutoDisposeAsyncNotifier<Hitokoto>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
