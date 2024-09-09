import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dio/dio.dart';

part '4.provider.g.dart';


void main() {
  runApp(const ProviderScope(child: MyApp()));
}

@riverpod
Future<String> futureHitokoto(FutureHitokotoRef ref) {
  return Dio().get('https://v1.hitokoto.cn/').then((value) {
    return value.toString();
  });
}

@riverpod
Stream<String> streamHitokoto(StreamHitokotoRef ref) async* {
  var response = await Dio().get('https://v1.hitokoto.cn/');
  print(response);
  yield response.data.toString();
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
          title: const Text('Riverpod Provider'),
        ),
        body: const Row(children: [
          Expanded(child: FutureProviderPage()),
          Expanded(child: StreamProviderPage())
        ]));
  }
}

class FutureProviderPage extends ConsumerWidget {
  const FutureProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final responseValue = ref.watch(futureHitokotoProvider);

    return Center(
      child: SingleChildScrollView(
          child: responseValue.when(
              data: (data) => Text(data.toString()),
              error: (e, stack) => Text('error: $e'),
              loading: () => const CircularProgressIndicator())),
    );
  }
}

class StreamProviderPage extends ConsumerWidget {
  const StreamProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final responseStream = ref.watch(streamHitokotoProvider);

    return Center(
      child: SingleChildScrollView(
          child: responseStream.when(
              data: (data) => Text(data.toString()),
              error: (e, stack) => Text('error: $e'),
              loading: () => const CircularProgressIndicator())),
    );
  }
}
