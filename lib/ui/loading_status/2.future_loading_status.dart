import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

enum LoadingStatus {
  initial,  // 初始化状态
  content,  // 显示内容
  loading, // 加载中
  empty,
  disconnect, // 断网
  error
}


var statusList = LoadingStatus.values;



class FutureLoadingStatusWidget<T> extends StatelessWidget{
  final Future<T>? future;  // 异步任务
  final Widget child; // 显示内容
  final void Function()?  retryCallback; // 重试回调

  const FutureLoadingStatusWidget({super.key,required this.child,this.retryCallback, this.future});


  Widget _dynamicLoadingStatus(BuildContext context,AsyncSnapshot snapshot){
    switch(snapshot.connectionState){
      case ConnectionState.none:
      case ConnectionState.active:
          return Container();
      case ConnectionState.waiting: return _loadingWidget();
      case ConnectionState.done:
        if(snapshot.hasError){
          if(snapshot.error is DioException && snapshot.error is SocketException){
            return _disconnectWidget();
          }
          return _errorWidget();
        }else{
          return snapshot.hasData? child : _emptyWidget();
        }
    }
  }

  Widget _loadingWidget(){
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            width: 21,
            height: 21,
            child: CircularProgressIndicator(
              strokeWidth: 2,
            )
        ),
        SizedBox(width: 4),
        Text('加载中...')
      ],
    );
  }

  Widget _emptyWidget(){
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('暂无数据')
      ],
    );
  }

  Widget _disconnectWidget(){
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.wifi_off),
        SizedBox(width: 4),
        Text('网络不可用'),
        // TextButton.icon(onPressed: retryCallback , label: const Text('重试'))
      ],
    );
  }

  Widget _errorWidget(){
    return const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          Icon(Icons.error),
          SizedBox(width: 4),
          Text('加载失败'),
        ]
    );
  }


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context,constraints){
      return SingleChildScrollView(
          child: ConstrainedBox(
            constraints:  BoxConstraints(
                minWidth: constraints.minWidth,
                minHeight: constraints.minHeight),
            child: IntrinsicHeight(
              child: FutureBuilder(future: future, builder: _dynamicLoadingStatus),
            ),
          )
      );
    });
  }}