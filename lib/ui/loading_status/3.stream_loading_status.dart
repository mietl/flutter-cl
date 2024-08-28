import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cl/ui/loading_status/enum.dart';


class StreamLoadingStatus {
  final LoadingStatus status;
  final dynamic data;

  StreamLoadingStatus(this.status,{this.data});
}


class StreamLoadingStatusWidget<T> extends StatefulWidget{
  final Future<T>? future;  // 异步任务
  final Widget Function(dynamic) child; // 显示内容
  final void Function()?  retryCallback; // 重试回调

  const StreamLoadingStatusWidget({super.key,required this.child,this.retryCallback, this.future});

  @override
  State<StatefulWidget> createState() {
    return _StreamLoadingStatusWidgetState();
  }

}

class _StreamLoadingStatusWidgetState extends State<StreamLoadingStatusWidget>{
  final StreamController<StreamLoadingStatus> _streamController = StreamController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _streamController.close();
  }
  @override
  Widget build(BuildContext context) {
    if(widget.future == null){
      _streamController.add(StreamLoadingStatus(LoadingStatus.initial));
    }else{
      _streamController.add(StreamLoadingStatus(LoadingStatus.loading));
      widget.future!.then((value){
        _streamController.add(StreamLoadingStatus(LoadingStatus.content,data: value));
      }).catchError((e){
        if(e is DioException){
          if(e.error is SocketException){
            _streamController.add(StreamLoadingStatus(LoadingStatus.disconnect,data: e));
          }else{
            _streamController.add(StreamLoadingStatus(LoadingStatus.error,data: e));
          }
        }else{
          _streamController.add(StreamLoadingStatus(LoadingStatus.error,data: e));
        }
      });
    }

    return LayoutBuilder(builder: (context,constraints){
      return SingleChildScrollView(
          child: ConstrainedBox(
            constraints:  BoxConstraints(
                minWidth: constraints.minWidth,
                minHeight: constraints.minHeight),
            child: IntrinsicHeight(
              child: StreamBuilder(stream: _streamController.stream, builder: (context,snapshot){
                  if(snapshot.connectionState == ConnectionState.active){
                    switch(snapshot.data!.status){
                      case LoadingStatus.initial:
                        return Container();
                      case LoadingStatus.loading:
                        return _loadingWidget();
                      case LoadingStatus.disconnect:
                        return _disconnectWidget();
                      case LoadingStatus.empty:
                        return _emptyWidget();
                      case LoadingStatus.error:
                        return _errorWidget();
                      case LoadingStatus.content:
                        return widget.child(snapshot.data);
                    }
                  }else{
                    return Container();
                  }
              }),
            ),
          )
      );
    });

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
  
}

