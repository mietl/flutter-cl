import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// 旧API
final clickCountProvider = StateProvider<int>((ref) => 0);

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
    final int count = ref.watch(clickCountProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Consumer'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('count:$count',style: const TextStyle(fontSize: 21)),
            OutlinedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CounterPage()));
                },
                child: const Text('open'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            ref.read(clickCountProvider.notifier).state++;
         },
          child: Icon(Icons.add),
      )
    );
  }
}

class CounterPage extends ConsumerWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int count = ref.watch(clickCountProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('计数'),
      ),
      body: Column(
        children: [Text('CounterPage: $count')],
      )
    );
  }
}
