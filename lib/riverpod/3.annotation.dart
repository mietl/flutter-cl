import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '3.annotation.g.dart';

@Riverpod(keepAlive: true)
// 不能使用公共方法执行副作用，只能共享状态
int clickCount(ClickCountRef ref) => 0;

@riverpod
class StarCount extends _$StarCount{
  @override
  int build() => 0;

  void increment(){
    state++;
  }
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
    final int count = ref.watch(starCountProvider);

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
          ref.read(starCountProvider.notifier).increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class CounterPage extends ConsumerWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int count = ref.watch(starCountProvider);

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
