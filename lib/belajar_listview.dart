import 'package:flutter/material.dart';

class ScrollingScreen extends StatelessWidget {
  const ScrollingScreen({super.key});

  final List<int> numberList = const <int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: numberList.map((number) {
          return Container(
            height: 250,
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(color: Colors.black),
            ),
            child: Center(
              child: Text(
                '$number', // Ditampilkan sesuai item
                style: const TextStyle(fontSize: 50),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class ScrollBuilder extends StatelessWidget {
  const ScrollBuilder({super.key});
  final List<int> numberList = const <int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemCount: numberList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              height: 250,
              decoration: BoxDecoration(
                color: Colors.grey,
                border: Border.all(color: Colors.black),
              ),
              child: Center(
                child: Text(
                  '${numberList[index]}',
                  style: const TextStyle(
                    fontSize: 50,
                  ),
                ),
              ));
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
            color: Colors.black,
            thickness: 2,
          );
        },
      ),
    );
  }
}
