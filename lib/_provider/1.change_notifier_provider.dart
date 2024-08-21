import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterNotifier extends ChangeNotifier{
  int counter = 0;

  void incrementCounter(){
    counter ++;
    notifyListeners();
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_)=> CounterNotifier(),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const ProviderPage()
        )
    );
  }
}


class ProviderPage extends StatefulWidget{
  const ProviderPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ProviderPageState();
  }
}

class _ProviderPageState extends State<ProviderPage>{
  @override
  Widget build(BuildContext context) {
    final counterState = Provider.of<CounterNotifier>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Provider')),
      body: Center(child: Text('counter:${counterState.counter}')),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            counterState.incrementCounter();
          },
          child: const Text('+1'),
      ),
    );
  }
}
