import 'package:flutter/material.dart';

import '../paper_tile.dart';

class ExpertPage extends StatelessWidget {
  ExpertPage({Key? key}) : super(key: key);

  List todaysHabitList = [
    ['Brownian Movement',false],
    ['0/1 Knapsack Problem',false],
    ['Minesweeper',false],
    ['String Theory',false],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Expert Page'),),
        body: ListView(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: todaysHabitList.length,
              itemBuilder: (context, index) {
                return PaperTile(
                  habitName: todaysHabitList[index][0],
                  habitCompleted: todaysHabitList[index][1],
                  onChanged: (value){},
                  settingsTapped: (context){},
                );
              },
            )
          ],
        )
    );
  }
}
