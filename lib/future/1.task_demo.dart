import 'dart:isolate';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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
  String _result  = '';

  void doCPUTask() async{
    var sum = 0;
    for(int i = 0;i < 1000000000;i++){
      sum+= i;
    }
    setState(() {
      _result = sum.toString();
    });
  }

  // 他依旧会导致主线程卡顿，事件循环到他的时候，主线程必须等待他完成
  Future<void> doCPUTaskFuture(){
    return Future((){
      var sum = 0;
      for(int i = 0;i < 1000000000;i++){
        sum+= i;
      }
      return sum;
    }).then((sum){
      setState(() {
        _result = sum.toString();
      });
    });
  }

  void doIsolateCPUTask() async {
    final resultPort  = ReceivePort();
    await Isolate.spawn((sendPort){
        var sum = 0;
        for(int i = 0;i < 1000000000;i++){
          sum+= i;
        }

        sendPort.send(sum);
    },resultPort.sendPort);

    int sum = await resultPort.first;

    setState(() {
      _result  = sum.toString();
    });
  }

  void doIOTask() async {
    // 这个接口，延迟二十秒返回结果
    Response response = await Dio().get('https://httpbin.org/delay/20');

    setState(() {
      _result = response.headers.toString();
    });
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
            const CircularProgressIndicator(),
            const SizedBox(height: 30),
            Text(
              '结果:$_result',
            ),
            ElevatedButton(onPressed: doIOTask, child: const Text('执行 IO 密集型任务')),
            ElevatedButton(onPressed: doCPUTask, child: const Text('执行计算密集型任务')),

            ElevatedButton(onPressed: doCPUTaskFuture, child: const Text('异步执行计算密集型任务')),

            ElevatedButton(onPressed: doIsolateCPUTask, child: const Text('使用isolate计算密集型任务'))
          ],
        ),
      )
    );
  }
}
