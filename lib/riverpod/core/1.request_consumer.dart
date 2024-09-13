import 'package:flutter/material.dart';
import 'package:flutter_cl/riverpod/core/hitokoto.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part '1.request_consumer.g.dart';

@riverpod
Future<Hitokoto> hitokoto(HitokotoRef ref) async {
  final response = await Dio().get('https://v1.hitokoto.cn/');
  return Hitokoto.fromJson(response.data);
}

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Request'),
        ),
        body: Consumer(builder: (context, ref, _) {
          final AsyncValue<Hitokoto> hitokoto = ref.watch(hitokotoProvider);
          return hitokoto.when(
              data: (value) => Text('$value'),
              error: (e, _) => Text('$e'),
              loading: () => const CircularProgressIndicator());
        }));
  }
}
