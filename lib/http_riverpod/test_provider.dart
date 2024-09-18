import 'package:riverpod_annotation/riverpod_annotation.dart';
import './http_api.dart';

part 'test_provider.g.dart';

@riverpod
Future<dynamic> getTest(GetTestRef ref) =>
    HttpAPI().get('https://httpbin.org/get').then((value) => value.data?.url);

@riverpod
Future<dynamic> postTest(PostTestRef ref, type) =>
    HttpAPI().post('https://httpbin.org/post',
        data: {type: type}).then((value) => value.data);
