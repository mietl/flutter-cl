import 'package:flutter/material.dart';
import 'package:flutter_cl/provider/counter.dart';
import 'package:flutter_cl/provider/login_status.dart';
import 'package:provider/provider.dart';
import 'package:dio/dio.dart';

void main() {
  // runApp(ChangeNotifierProvider(
  //     create: (context) => LoginStatusModel(), child: const MyApp()));
  runApp(MultiProvider(providers: [
    // 2.
    ChangeNotifierProvider(create: (context) => LoginStatusProvider()),
    ChangeNotifierProvider(create: (context) => CounterProvider())
  ], child: const MyApp()));
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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future fetchHitokoto() {
    return Dio().get('https://v1.hitokoto.cn/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Overview(),
            FutureProvider(
              initialData: '2214',
              create: (context) => fetchHitokoto(),
              child: Consumer<String>(
                builder: (context, value, child) {
                  return Text(value);
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: Consumer<CounterProvider>(
        builder: (context, counter, child) {
          return FloatingActionButton(
            onPressed: () {
              counter.incrementCounter();
            },
            child: child,
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Overview extends StatelessWidget {
  const Overview({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLogin = Provider.of<LoginStatusProvider>(context).isLogin;

    return Column(
      children: [
        Text(isLogin ? 'mietl' : '游客'),
        Consumer<LoginStatusProvider>(builder: (context, loginStatus, child) {
          return Text(isLogin ? 'consumer' : '游客');
        }),
      ],
    );
  }
}
