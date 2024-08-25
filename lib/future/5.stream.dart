void main(){
  useFirstStream();
}


Future<String> fetchHttpData() async {
  await Future.delayed(const Duration(seconds: 4));
  return 'Future data';
}

void useFirstStream(){
  // 1. 将一个 Future转化为 Stream
  Stream.fromFuture(fetchHttpData()).listen((data)=>print(data));

  // 2. 根据可迭代 创建流
  Stream.fromIterable([1,2,4,4]).listen((data)=>print(data)); // > 1 、 2、 4 、4

  // 3  . 创建一个周期性发出事件的流
  Stream.periodic(const Duration(seconds: 1),(computationCount){
    return '第$computationCount次';
  }).take(5).listen((data)=>print(data)); // 获取流中的前5个事件


  // 4. 创建一个单一值的流
  Stream valueStream = Stream.value('日记');
  valueStream.listen((data)=>print(data));
}