Stream<int> numsStream() async*{
  for(int i = 1; i <= 4;i++){
    yield i; // 向 stream中发射值
    await Future.delayed(const Duration(milliseconds: 500));
  }
}

Stream<int> pipeNumsStream() async* {
  yield * numsStream();
}

void main() async {
 await for (int number in numsStream()){
   print('yeild: $number');
 }

 await for(int number in pipeNumsStream()){
   print('yield* :$number');
 }
}