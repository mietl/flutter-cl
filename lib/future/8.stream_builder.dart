import 'dart:async';

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
        home: const MyHomePage(title: 'Flutter Demo Home Page')
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
  late  Stream<List> _listStream;
  late StreamController<List> _listStreamController;


  List cacheInitData(){

    return ['花绳','便签','贴纸','...'];
  }


  Future<List> _requestData() async {
    Response response = await Dio().get('https://jsonplaceholder.typicode.com/users');
    return response.data;
  }

  void fetchState() async {
    try{
      var data = await _requestData();
      _listStreamController.add(data);  // 发送数据


      await Future.delayed(const Duration(seconds: 3));
      _listStreamController.add(['3秒后']);
    }catch(e){
      _listStreamController.addError(e);
    }
  }


  @override
  void initState() {
    super.initState();

    _listStreamController = StreamController();
    _listStream = _listStreamController.stream;

    fetchState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: StreamBuilder(
          stream: _listStream,
          builder: (context,snapshot){
            switch(snapshot.connectionState){
              case ConnectionState.none:
                print('1. Stream还未开始');
                return const Center(
                  child: Text('Stream还未开始'),
                );
              case ConnectionState.waiting:
                print('2. Stream已经开始，正在等待');
                if(snapshot.hasData){
                  print('2. initialData: ${snapshot.data.toString()}');
                }
                return const Center(
                  child: Text('Stream 已经开始正在等待'),
                );
              case ConnectionState.active:
                print('3. Stream正在执行，还未完成');
                return const Center(
                  child: Text('Stream正在执行，还未完成'),
                );
              case ConnectionState.done:

                if(snapshot.hasError){
                  print('4. Stream完成:失败');
                  return const Center(
                    child: Text('Stream失败: 发生错误'),
                  );
                }else{
                  print('4.Stream完成:成功');
                  return const Center(
                    child: Text('Future成功'),
                  );
                }
            }
          },
          initialData: cacheInitData(),
        )
    );
  }

}
