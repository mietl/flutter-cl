// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getTestHash() => r'ba2ef424f8f82f4e824b9c127c97bfbabc6081b8';

/// See also [getTest].
@ProviderFor(getTest)
final getTestProvider = AutoDisposeFutureProvider<dynamic>.internal(
  getTest,
  name: r'getTestProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getTestHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetTestRef = AutoDisposeFutureProviderRef<dynamic>;
String _$postTestHash() => r'72eb0a9262d1ae4edbfc470325c781aca17579ea';

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

/// See also [postTest].
@ProviderFor(postTest)
const postTestProvider = PostTestFamily();

/// See also [postTest].
class PostTestFamily extends Family<AsyncValue<dynamic>> {
  /// See also [postTest].
  const PostTestFamily();

  /// See also [postTest].
  PostTestProvider call(
    dynamic type,
  ) {
    return PostTestProvider(
      type,
    );
  }

  @override
  PostTestProvider getProviderOverride(
    covariant PostTestProvider provider,
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
  String? get name => r'postTestProvider';
}

/// See also [postTest].
class PostTestProvider extends AutoDisposeFutureProvider<dynamic> {
  /// See also [postTest].
  PostTestProvider(
    dynamic type,
  ) : this._internal(
          (ref) => postTest(
            ref as PostTestRef,
            type,
          ),
          from: postTestProvider,
          name: r'postTestProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$postTestHash,
          dependencies: PostTestFamily._dependencies,
          allTransitiveDependencies: PostTestFamily._allTransitiveDependencies,
          type: type,
        );

  PostTestProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.type,
  }) : super.internal();

  final dynamic type;

  @override
  Override overrideWith(
    FutureOr<dynamic> Function(PostTestRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PostTestProvider._internal(
        (ref) => create(ref as PostTestRef),
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
  AutoDisposeFutureProviderElement<dynamic> createElement() {
    return _PostTestProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PostTestProvider && other.type == type;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, type.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PostTestRef on AutoDisposeFutureProviderRef<dynamic> {
  /// The parameter `type` of this provider.
  dynamic get type;
}

class _PostTestProviderElement extends AutoDisposeFutureProviderElement<dynamic>
    with PostTestRef {
  _PostTestProviderElement(super.provider);

  @override
  dynamic get type => (origin as PostTestProvider).type;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
