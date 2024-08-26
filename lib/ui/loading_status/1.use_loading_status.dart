import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cl/ui/loading_status/index.dart';


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
   var _loadingStatus = LoadingStatus.initial;
   String hitokoto = '';



   void fetchState(){
     _updateLoadingStatus(LoadingStatus.loading);
     Dio().get('https://v1.hitokoto.cn/').then((value){
        hitokoto = value.data['hitokoto'];

       _updateLoadingStatus(LoadingStatus.content);
     }).catchError((e){
        hitokoto = e.toString();
        if(e is DioException){
          if(e.error is SocketException){
            _updateLoadingStatus(LoadingStatus.disconnect);
          }
        }
        _updateLoadingStatus(LoadingStatus.error);
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
          children: [
            OutlinedButton(onPressed: fetchState , child: const Text('fetch')),
            const SizedBox(
              height: 7,
            ),
            // _loadingStatus 改变会重新执行 LoadingStatusWidget  build hitokoto 获取到的就是最新的，因此不需要 setState
            LoadingStatusWidget(
                status: _loadingStatus,
                child: Text(hitokoto)
            )
          ],
        ),
      )
    );
  }

  void _updateLoadingStatus(LoadingStatus status){
     setState(() {
       _loadingStatus = status;
     });
  }
}