import 'package:flutter/material.dart';

import 'enum.dart';



Widget testLoadingStatusWidget(){
  return GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
    ),
    itemCount: statusList.length,
    itemBuilder: (context,int index){
      return Center(
          child: LoadingStatusWidget(
            status: statusList[index],
            child: const Text('内容'),
          ),
      );
    },
  );
}


class LoadingStatusWidget extends StatelessWidget{
  final LoadingStatus status; // 状态
  final Widget child; // 显示内容
  final void Function()?  retryCallback; // 重试回调

  const LoadingStatusWidget({super.key,required this.child,required this.status,this.retryCallback});


  Widget _dynamicLoadingStatus(LoadingStatus status){
    switch(status){
      case LoadingStatus.initial: return Container();
      case LoadingStatus.content: return child;
      case LoadingStatus.loading: return _loadingWidget();
      case LoadingStatus.empty: return _emptyWidget();
      case LoadingStatus.disconnect: return _disconnectWidget();
      case LoadingStatus.error:  return _errorWidget();
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
                child: _dynamicLoadingStatus(status),
             ),
        )
      );
    });
  }}