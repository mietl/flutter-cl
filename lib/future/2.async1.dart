// ignore_for_file: unused_local_variable

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

  var order1 = await fetchUserOrder1();
  var order2 = await fetchUserOrder2();
  var order3 = await fetchUserOrder3();

  var endTime = DateTime.now().second;
  print((endTime - startTime).toString()); // >  6s
}
