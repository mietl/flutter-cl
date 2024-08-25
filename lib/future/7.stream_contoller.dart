import 'dart:async';

void main(){

  // StreamController(单订阅） / SteamController.broadcast(多订阅)
  var contoller = StreamController<int>();

  // 订阅 /  我需要监听流的改变
  contoller.stream.listen(
      (data){
        print('received: $data');
      },
      onDone: (){
        print('done');
      },
      onError: (e){
        print('error:$e');
      }
  );


 // 向流中添加数据
  contoller.sink.add(2);
  contoller.sink.add(1);
  contoller.sink.addError('unknown');
  contoller.sink.add(4);

  contoller.close();


}




