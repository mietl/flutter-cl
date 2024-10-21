import 'dart:math';

import 'package:flutter/material.dart';

class PickColorPage extends StatefulWidget {
  final Color color;
  const PickColorPage(this.color, {super.key});

  @override
  State<StatefulWidget> createState() {
    return _PickColorPageState();
  }
}

class _PickColorPageState extends State<PickColorPage> {
  late List<Color> colors;

  @override
  void initState() {
    final Random random = Random();

    colors = List.generate(
        17,
        (index) => Color.fromARGB(
              255, // 固定 alpha 值为 255（不透明）
              random.nextInt(256), // 随机生成 0-255 的 R 值
              random.nextInt(256), // 随机生成 0-255 的 G 值
              random.nextInt(256), // 随机生成 0-255 的 B 值
            ));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final boxSize = MediaQuery.of(context).size.width / 4 - 10;

    return Scaffold(
      appBar: AppBar(title: const Text('pick color')),
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          children: [
            Row(
              children: [
                const Text('接收参数', style: TextStyle(fontSize: 17)),
                const SizedBox(width: 40),
                _buildColorBlack(widget.color, 70.0),
              ],
            ),
            const SizedBox(
              height: 17.0,
            ),
            const Text('传递颜色'),
            const SizedBox(
              height: 17.0,
            ),
            Expanded(
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            mainAxisSpacing: 4.0,
                            crossAxisSpacing: 4.0),
                    itemCount: colors.length,
                    itemBuilder: (context, index) =>
                        _buildColorBlack(colors[index], boxSize)))
          ],
        ),
      ),
    );
  }

  _buildColorBlack(color, size) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop(color);
      },
      child: Container(
        width: size,
        height: size,
        color: color,
        child: Text(color.toString()),
      ),
    );
  }
}
