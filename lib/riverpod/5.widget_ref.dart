import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '5.widget_ref.g.dart';


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
      home: Scaffold(
        appBar: AppBar(title: const Text('WidgetRef')),
        body: const AsyncValueUI(),
      ),
    );
  }
}


@riverpod
Future<int> someState(SomeStateRef ref)=> Future.delayed(Duration(seconds: 3),()=>14);

class UseWidgetRef extends ConsumerStatefulWidget{
  const UseWidgetRef({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _UseWidgetRefState();
  }
}

class _UseWidgetRefState extends ConsumerState<UseWidgetRef>{
  @override
  Widget build(BuildContext context) {
    final some = ref.watch(someStateProvider);
    return  Text(some.value.toString());
  }
}

class AsyncValueUI extends StatelessWidget {
  const AsyncValueUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (context,ref,child){
           final asyncValue = ref.watch(someStateProvider);
          // final AsyncValue<AsyncValueExample> asyncValue = ref.watch(someStateProvider);
          return Center(
            child: switch(asyncValue){
              AsyncData(:final value)=> Text('data:$value'),
              AsyncError(:final error)=> const Text('error'),
              _=> const Text('loading')
            },
          );
        }
    );
  }

}