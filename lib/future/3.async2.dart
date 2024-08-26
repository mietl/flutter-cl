Future<String> fetchUserOrder1() =>
    Future.delayed(const Duration(seconds: 1), () => 'Order 1');

Future<String> fetchUserOrder2() =>
    Future.delayed(const Duration(seconds: 2), () => 'Order2');

Future<String> fetchUserOrder3() =>
    Future.delayed(const Duration(seconds: 3), () => 'Order3');

void main(List<String> args) {
  doTasks();
}

// 并行执行
Future<void> doTasks() async {
  var startTime = DateTime.now().second;

  var order1 = fetchUserOrder1();
  var order2 = fetchUserOrder2();
  var order3 = fetchUserOrder3();

  await order1;
  await order2;
  await order3;

  // 三个任务同时进行，当任务3结束时，任务2 早已经执行完了，所以结果是3秒

  var endTime = DateTime.now().second;
  print((endTime - startTime).toString()); // >  3s
}
