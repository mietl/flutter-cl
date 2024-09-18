import 'package:flutter/material.dart';
import 'package:flutter_cl/http_riverpod/test_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var postResponse = ref.watch(postTestProvider('c'));
    var getResponse = ref.watch(getTestProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('test request'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'get: ${getResponse.value}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              'post:${postResponse.value}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            OutlinedButton(
                onPressed: () => ref.refresh(getTestProvider),
                child: const Text('get')),
            OutlinedButton(
                onPressed: () => ref.refresh(postTestProvider('t').future),
                child: const Text('post')),
          ],
        ),
      ),
    );
  }
}
