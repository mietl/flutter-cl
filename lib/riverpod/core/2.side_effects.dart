import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '2.side_effects.g.dart';

main() {
  runApp(const ProviderScope(child: MyApp()));
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
      home: const SideEffectDemo(),
    );
  }
}

class Todo {
  String? description;
  bool? completed;

  Todo({required this.description, this.completed});
}

@riverpod
class TodoListNotifier extends _$TodoListNotifier {
  @override
  Future<List<Todo>> build() {
    // 模拟网络请求
    return Future(() => [Todo(description: '想做什么'), Todo(description: '做点什么')]);
  }

  // Future<void> addTodo(Todo todo) async {
  //   await Dio().post('api.com/todos');

  //   // 使当前状态无效，重新请求
  //   ref.invalidateSelf();
  //   // 将重新请求数据时间，也计算添加的时间内，使用await future
  //   await future;
  // }

  Future<void> addTodo(Todo todo) async {
    await Dio().post('api.com/todos');

    final previousState = await future;

    // 然后我们可以通过创建一个新的状态对象来更新状态。
    // 这将通知所有监听器。
    state = AsyncData([...previousState, todo]); // 将新的待办事项加入之前的状态中，并更新状态

    // 可变更改
    // if (previousState != null) {
    //   previousState.add(todo);
    //   ref.notifyListeners();
    // }
  }
}

class SideEffectDemo extends ConsumerStatefulWidget {
  const SideEffectDemo({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _SideEffectDemoState();
  }
}

class _SideEffectDemoState extends ConsumerState<SideEffectDemo> {
  Future<void>? _pendingAddTodo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('side effect')),
      body: FutureBuilder(
          future: _pendingAddTodo,
          builder: (context, snapshot) {
            final isErrored = snapshot.hasError &&
                snapshot.connectionState != ConnectionState.waiting;

            return Row(
              children: [
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                            isErrored ? Colors.red : null)),
                    onPressed: () {
                      final future = ref
                          .read(todoListNotifierProvider.notifier)
                          .addTodo(Todo(description: '创建文件夹'));

                      setState(() {
                        _pendingAddTodo = future;
                      });
                    },
                    child: const Text('Add Todo')),
                if (snapshot.connectionState == ConnectionState.waiting) ...[
                  const SizedBox(width: 14),
                  const CircularProgressIndicator()
                ]
              ],
            );
          }),
    );
  }
}
