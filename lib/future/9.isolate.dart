import 'dart:isolate';

void main(){
  doCPUTask();
}

void echo(SendPort sendPort){
  int sum = 0;
  for(int i = 0; i < 1000000000; i++){
    sum+=i;
  }

  sendPort.send(sum);

  sendPort.send('second');

  sendPort.send(Error());

  sendPort.send('close');
}

void doCPUTask() async {
  // 1. 创建接收对象
  final receivePort = ReceivePort();

  // 创建单独isolate
  final isolate = await Isolate.spawn(echo, receivePort.sendPort);

    receivePort.listen((message){
      print('接收消息:$message');

      if(message == 'close'){
        receivePort.close();
        isolate.kill();
      }
    },onError: (error){
      print('catch error:$error');
    },onDone: (){
      print('done');
    });
}
